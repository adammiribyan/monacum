var Button = function(id, options){
  this.pressed = false;
  this.loading = false;
  this.disabled = options.disabled || false;
  this.button = $('#' + id);
  this.initEvents(options);
  return this;
};
Button.loadingTpl = '<div class="loading"></div>';
Button.prototype.initEvents = function(options){
  var object = this,
      $button = this.button;
  $button.bind('mouseenter', function(){
    if(!$button.hasClass('button-disabled')) $button.addClass('button-hovered');
  })
  .bind('mouseleave', function(){
    if(!$button.hasClass('button-disabled')) $button.removeClass('button-hovered');
  })
  .bind('mousedown', function(event){
    if((event.which == 1) && (!object.loading) && (!object.disabled)) {
      object.loading = true;
      $button.addClass('button-pressed');
      object.initLoading();
      $button.trigger('options');
    }
  })
  .bind('options', options.click);
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

button = LAM.Buttons.init('abuseSend', {disabled: true, click: function(){
              $.ajax({
                type: 'post',
                datatype: 'text',
                url: abuse_path,
                data: {
                  'abuse[resource_type]': resource_type,
                  'abuse[resource_id]': resource_id,
                  'abuse[abuse_type_id]': typeInput.filter(':checked').val(),
                  'abuse[body]': textInput.val()
                },
                success: function(data){
                  },
                complete: function() {
                  abuseStatus.html('Ваша&nbsp;жалоба&nbsp;принята');
                  setTimeout(function(){abuseStatus.html('')}, 5000);
                  textInput.blur().val('');
                  button.stopLoading().disable();
                }
              });
              return false;
             }});