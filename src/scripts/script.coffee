
$(document).ready ->

	model = new Backbone.Model {name: 'john lennon'}
	new ViewName {el: '#main', model: model }
	
	$('#change').click ->
		text = $('#templateText').val()
		model.set {name: text}
	
		
	
	



