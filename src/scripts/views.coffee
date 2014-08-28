
class ViewName extends Backbone.View
	model: new Backbone.Model {name: 'Colonas'}

	initialize : =>
		window.Model = @model
		@listenTo @model, 'change', @render
		@render()
	render : =>
		console.log @model.toJSON()
		$(@el).empty()
		$(@el).append View.templates['simple-template'] @model.toJSON()

window.ViewName = ViewName

