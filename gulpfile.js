'use strict';

/**
  * Load Dependiencies
  */

var gulp       = require('gulp'),
  connect      = require('gulp-connect'),
  coffeelint   = require('gulp-coffeelint'),
  stylish      = require('coffeelint-stylish'),
  uglify       = require('gulp-uglify'),
  sass         = require('gulp-sass'),
  minifyCSS    = require('gulp-minify-css'),
  clean        = require('gulp-clean'),
  livereload   = require('gulp-livereload'),
  coffee       = require('gulp-coffee'),
  gutil        = require('gulp-util'),
  wiredep      = require('wiredep').stream;

/**
  * Gulp Configurations
  */

var config = {
  tmpDir: './.tmp',
  prodDir: './dist',
  prod: !!gutil.env.production,
  serve: !gutil.env.build,
  init: function(){
    this.buildDir = this.prod ? this.prodDir : this.tmpDir;
    return this;
  }
}.init();

/**
  * Build Tasks
  */

// lint files
gulp.task('lint', function() {
  gulp.src(['./app/**/*.coffee', '!./app/bower_components/**'])
    .pipe(coffeelint())
    .pipe(coffeelint.reporter(stylish))
});

// empty .tmp folder
gulp.task('clean', function() {
    gulp.src(config.tmpDir + '/*')
      .pipe(clean({force: true}));
    gulp.src(config.prodDir + '/*')
      .pipe(clean({force: true}));
});

// Render coffescript to js
gulp.task('coffee', function(){
  gulp.src('./app/**/*.coffee')
    .pipe(coffee({bare: false}).on('error', gutil.log))
    .pipe(gulp.dest(config.buildDir));

  // Production Uglify
  if(config.prod){
    gulp.src([config.prodDir + '/**/*.js'])
      .pipe(uglify())
      .pipe(gulp.dest(config.prodDir));
  }
});

gulp.task('sass', function(){
  var dir = config.buildDir;
  var dev = {sourceComments: true};
  var prod = {outputStyle: 'compressed'};
  gulp.src(['./app/sass/**/*.scss'])
    .pipe(sass(config.prod? prod : dev).on('error', sass.logError))
    .pipe(gulp.dest(dir + '/css'))
});

// Pull in html files
gulp.task('copy-html', function () {
  gulp.src(['./app/**/*.html', '!./app/index.html'])
    .pipe(gulp.dest(config.buildDir));
  // Inject bower depenencies
  gulp.src('./app/index.html')
    .pipe(wiredep({
      ignorePath:  /\.\.\//,
    }))
    .pipe(gulp.dest(config.buildDir));
});

// Setup bower dependencies
gulp.task('bower', function () {
  var dir = config.buildDir;
  // Copy bower components
  gulp.src('./bower_components/**')
    .pipe(gulp.dest(dir + '/bower_components'));
});

/**
  * Serve Tasks
  */

gulp.task('serve', function () {
  if(config.serve){
    gutil.log("Running server from " + config.buildDir);
    connect.server({
      root: config.buildDir,
      port: config.prod ? 9999 : 8888
    });
  }
});

//Connect Livereload for easy Development
gulp.task('livereload', function() {
  livereload.reload();
})

gulp.task('watch', function() {
  if(config.serve){
    livereload.listen();
    gulp.watch(['app/**/*.html', 'app/js/*.coffee', 'app/sass/*.scss'], ['livereload', 'lint', 'coffee', 'sass', 'copy-html']);
  }
});


// default task
gulp.task('default',
  ['lint', 'coffee', 'sass', 'copy-html', 'bower', 'serve', 'watch']
);
