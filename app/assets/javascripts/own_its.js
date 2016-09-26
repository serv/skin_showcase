$(document).on('turbolinks:load', function() {
  var OwnIt = function(object) {
    this.skin_id = GLOBAL.skinId;
    this.$selector = object.selector;
  }

  OwnIt.initialize = function() {
    var ownIts = [];
    var ownIt;
    $('.skin-actionables-ownit').each(function() {
      ownIt = new OwnIt({ selector: this });
      ownIt.initialize();
      ownIts.push(ownIt);
    });
  };

  OwnIt.prototype.initialize = function() {
    this.onClick();
  };

  OwnIt.prototype.onClick = function() {
    var self = this;
    $(self.$selector).on('click', function() {
      self.save();
    });
  };

  OwnIt.prototype.save = function() {
    var self = this;
    $.ajax({
      method: 'POST',
      url: "/ownits",
      data: { ownit: { skin_id: self.skin_id } }
    })
      .done(function(msg) {
        console.log("Data Saved: " + msg);
      });
  };

  OwnIt.initialize();
})
