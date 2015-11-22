AppView = Backbone.View.extend({
    el: '#hello-word'

    initialize : ->
    	this.render();

    render: ->
    	this.$el.html("Hellos World!");
})

test = AppView()
