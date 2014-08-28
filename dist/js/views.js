var ViewName,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

ViewName = (function(_super) {
  __extends(ViewName, _super);

  function ViewName() {
    this.render = __bind(this.render, this);
    this.initialize = __bind(this.initialize, this);
    return ViewName.__super__.constructor.apply(this, arguments);
  }

  ViewName.prototype.initialize = function() {
    window.Model = this.model;
    this.listenTo(this.model, 'change', this.render);
    return this.render();
  };

  ViewName.prototype.render = function() {
    console.log(this.model.toJSON());
    $(this.el).empty();
    return $(this.el).append(View.templates['simple-template'](this.model.toJSON()));
  };

  return ViewName;

})(Backbone.View);

window.ViewName = ViewName;
