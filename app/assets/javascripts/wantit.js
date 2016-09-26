$(document).on('turbolinks:load', function() {
  var Wantit = function(object) {
    this.skin_id = GLOBAL.skinId;
    this.$selector = object.selector;
  }

  Wantit.initialize = function() {
    var wantIts = [];
    var wantIt;
    $('.skin-actionables-wantit').each(function() {
      wantIt = new Wantit({ selector: this });
      wantIt.initialize();
      wantIts.push(wantIt);
    });
  };

  Wantit.prototype.initialize = function() {
    this.onClick();
  };

  Wantit.prototype.onClick = function() {
    var self = this;
    $(self.$selector).on('click', function() {
      self.save();
    });
  };

  Wantit.prototype.save = function() {
    var self = this;
    $.ajax({
      method: 'POST',
      url: "/wantits",
      data: { wantit: { skin_id: self.skin_id } }
    })
      .done(function(msg) {
        console.log("Data Saved: " + msg);
      });
  };

  Wantit.initialize();
})
