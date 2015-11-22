var AppView, test;

AppView = Backbone.View.extend({
  el: '#hello-word',
  initialize: function() {
    return this.render();
  },
  render: function() {
    return this.$el.html("Hello World!");
  }
});

test = AppView();
