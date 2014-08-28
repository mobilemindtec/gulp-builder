$(document).ready(function() {
  var model;
  model = new Backbone.Model({
    name: 'john lennon'
  });
  new ViewName({
    el: '#main',
    model: model
  });
  return $('#change').click(function() {
    var text;
    text = $('#templateText').val();
    return model.set({
      name: text
    });
  });
});
