$(document).ready(function() {
  /* facebox */
  $.facebox.settings.closeImage = '/images/facebox/closelabel.png'
  $.facebox.settings.loadingImage = '/images/facebox/loading.gif'
  $('a[rel*=facebox]').facebox();
  
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