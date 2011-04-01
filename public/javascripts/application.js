var View = {
  initialize: function() {
    /* Animate flashes */
    this.flashes.animate();

    /* facebox */
    $.facebox.settings.closeImage = '/images/facebox/closelabel.png'
    $.facebox.settings.loadingImage = '/images/facebox/loading.gif'
    $('a[rel*=facebox]').facebox();
  },

  flashes: {
    animate: function() {
      var $this = $(View.flashes.selector);
      $this.animate({
        top: 0
      }).delay(2000).animate({
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
  
  $button = $(".new-button")
  $button.bind('mouseenter', function(){
    if(!$button.hasClass('button-disabled')) $button.addClass('button-hovered');
  })
  .bind('mouseleave', function(){
    if(!$button.hasClass('button-disabled')) $button.removeClass('button-hovered');
  })
  .bind('mousedown', function(event){
    $button.addClass('button-pressed');    
  })
  .bind('mouseup', function() {
    $button.removeClass('button-pressed');
  })
})