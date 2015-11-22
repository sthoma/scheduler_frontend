/**
  * Load Dependiencies
  */

var gulp       = require('gulp'),
	connect      = require('gulp-connect'),
	coffeelint   = require('gulp-coffeelint'),
  stylish      = require('coffeelint-stylish'),
	uglify       = require('gulp-uglify'),
	minifyCSS    = require('gulp-minify-css'),
	clean        = require('gulp-clean'),
	livereload   = require('gulp-livereload'),
	coffee       = require('gulp-coffee'),
	gutil        = require('gulp-util'),
	wiredep      = require('wiredep').stream;

/**
  * Build Development Environment
  */

// lint coffee files
gulp.task('coffeelint', function() {
  gulp.src(['./app/**/*.coffee', '!./app/bower_components/**'])
    .pipe(coffeelint())
    .pipe(coffeelint.reporter(stylish))
});

// empty .tmp folder
gulp.task('clean-dev', function() {
    gulp.src('./.tmp/*')
      .pipe(clean({force: true}));
});

// Render coffescript to js
gulp.task('coffee-dev', function(){
  gulp.src('./app/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./.tmp'));
});

// Pull in html files
gulp.task('copy-html-files-dev', function () {
  gulp.src(['./app/**/*.html', '!./app/index.html'])
    .pipe(gulp.dest('./.tmp'));
});

// Copy bower_components
gulp.task('copy-bower-dev', function () {
  gulp.src('./bower_components/**')
    .pipe(gulp.dest('./.tmp/bower_components'));
});

// Write Bower dependencies to html
gulp.task('bower', function () {
  gulp.src('./app/index.html')
    .pipe(wiredep({
    }))
    .pipe(gulp.dest('./.tmp'));
});

gulp.task('develop', function () {
  connect.server({
    root: '.tmp/',
    port: 8888
  });
});


/**
  * Build Production Environment
  */

// empty dist folder
gulp.task('clean-prod', function() {
    gulp.src('./dist/*')
      .pipe(clean({force: true}));
});

// minify css for production
gulp.task('minify-css', function() {
  var opts = {comments:true,spare:true};
  gulp.src(['./.tmp/**/*.css'])
    .pipe(minifyCSS(opts))
    .pipe(gulp.dest('./dist/'))
});

// minify js for production
gulp.task('minify-js', function() {
  gulp.src(['./.tmp/**/*.js'])
    .pipe(uglify({
      // inSourceMap:
      // outSourceMap: "app.js.map"
    }))
    .pipe(gulp.dest('./dist/'))
});

// Create a copy of the bower libraries
gulp.task('copy-bower-prod', function () {
  gulp.src('./bower_components/**')
    .pipe(gulp.dest('./dist/bower_components'));
});

// Pull in html files
gulp.task('copy-html-prod', function () {
  gulp.task('bower-dep', ['bower']);
  gulp.src('./.tmp/**/*.html')
    .pipe(gulp.dest('./dist/'));
});



gulp.task('production', function () {
  connect.server({
    root: 'dist/',
    port: 9999
  });
});

//Connect Livereload for easy Development
gulp.task('livereload', function() {
  livereload.reload();
})

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch(['app/**/*.html', 'app/**/*.coffee'], ['livereload', 'coffeelint', 'coffee-dev']);
});


// default task
gulp.task('default',
  ['coffeelint', 'coffee-dev', 'copy-html-files-dev', 'copy-bower-dev', 'bower', 'develop', 'watch']
);

// // build task
// gulp.task('build', function(){
//   gulp.task('build-default', ['default']);
//   gulp.task('copy-to-dist',
//     ['lint', 'minify-css', 'minify-js', 'copy-html-files', 'copy-bower-components', 'production']
//   );
// });
