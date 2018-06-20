$(function () {
  $('#timepicker').datetimepicker({
    format: I18n.t('hm')
  });
});

$(function () {
  $('#timepickerOts').datetimepicker({
    format: I18n.t('hm')
  });
});

$(function () {
  $('#timepickerOte').datetimepicker({
    format: I18n.t('hm')
  });
});

$(function () {
  $('#datepicker').datetimepicker({
    viewMode: "years",
    format: I18n.t('dmy')
  });
});

$(function () {
  $('#datepickerOff').datetimepicker({
    viewMode: "years",
    format: I18n.t('dmy')
  });
});

$(document).ready(function() {
  $('input[type="radio"][data-behavior="clickable"]').click(function(evt) {
    if ($(this).val() == I18n.t("dateoff")){
      $('.illeform').css("display", "none");
    }
    else{
      $('.illeform').css("display", "block");
    }
  });
});

