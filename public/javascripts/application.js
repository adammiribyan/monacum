var Button = function(id, e){
  this.pressed = false;
  this.loading = false;
  this.disabled = e.disabled || false;
  this.button = $('#' + id);
  this.initEvents(e);
  return this;
};
Button.loadingTpl = '<div class="loading"></div>';
Button.prototype.initEvents = function(e){
  var obj = this,
      $button = this.button;
  $button.bind('mouseenter', function(){
    if(!$button.hasClass('button-disabled')) $button.addClass('button-hovered');
  })
  .bind('mouseleave', function(){
    if(!$button.hasClass('button-disabled')) $button.removeClass('button-hovered');
  })
  .bind('mousedown', function(event){
    if((event.which == 1) && (!obj.loading) && (!obj.disabled)) {
      obj.loading = true;
      $button.addClass('button-pressed');
      obj.initLoading();
      $button.trigger('e');
    }
  })
  .bind('e', e.click);
};
Button.prototype.initLoading = function(){
  this.loading = true;
  this.button.addClass('button-loading').append(Button.loadingTpl);
  return this;
};
Button.prototype.stopLoading = function(){
  this.loading = false;
  this.button.removeClass('button-loading').removeClass('button-pressed').remove('.loading');
  return this;
};
Button.prototype.enable = function() {
  this.disabled = false;
  this.button.removeClass('button-disabled');
  return this;
};
Button.prototype.disable = function() {
  this.disabled = true;
  this.button.addClass('button-disabled');
  return this;
};

var LAM = LAM || {};
LAM.Buttons = function(){
  return LAM.Buttons.init.apply(this, arguments);
};
LAM.Buttons.instances = {};
LAM.Buttons.init = function(id, options) {
  return LAM.Buttons.instances[id] = new Button(id, options);
};
LAM.Buttons.stop = function(id){
  this.instances[id].stopLoading();
};
LAM.Buttons.stop = function(id){
  this.instances[id].stopLoading();
};

/* buttons with class .submit-form
 * submits closest parent form 
 * by default  
**************************************/
$('.submit-form').live('click', function(){
  $(this).closest('form').submit();
  return false;
});

var View = {
  initialize: function() {
    /* Animate flashes */
    this.flashes.animate();
    
    /* Buttons */
    this.buttons.initialize();

    /* facebox */
    $.facebox.settings.closeImage = '/images/facebox/closelabel.png'
    $.facebox.settings.loadingImage = '/images/facebox/loading.gif'
    $('a[rel*=facebox]').facebox();
  },
  
  buttons: {
    initialize: function() {
      buttons = $(document).find(View.buttons.selector);      
      buttons.mousedown(function() {
        if (!$(this).hasClass("button-disabled")) {
          $(this).addClass('button-pressed');
        }
      });  
      buttons.mouseup(function(){$(this).removeClass('button-pressed');});  
      buttons.mouseover(function() {
        if (!$(this).hasClass("button-disabled")) {
          $(this).addClass('button-hovered');
        }
      });  
      buttons.mouseleave(function(){$(this).removeClass('button-hovered');});
    },
    selector: ".new-button"
  },

  flashes: {
    animate: function() {
      var $this = $(View.flashes.selector);
      $this.animate({
        top: 0
      }).delay(3000).animate({
        top: -100
      }, $this.remove)
    },
    render: function(result) {
      $("<div/>")
        .attr("id", (result.success) ? "flash_notice" : "flash_error")
        .prependTo(document.body)
        .html(result.notice);
      View.flashes.animate();
    },
    selector: "#flash_notice, #flash_error, #flash_alert"
  }
};

$(document).ready(function() {
  View.initialize.apply(View);
  
  /* magick search field */
  $(".overlay-wrapper > input").attr("value", "")
  
  $(".overlay-wrapper > input").focusin(function() {
		$("label[for="+ this.id +"]").addClass("focus");
	})
	.blur(function() {
		if (this.value == "") {
			$("label[for="+ this.id +"]").removeClass("focus").show();
		}		
	})
	.keypress(function() {
		if (event.keyCode == Event.KEY_TAB) return;
		$("label[for="+ this.id +"]").hide();
	});
})