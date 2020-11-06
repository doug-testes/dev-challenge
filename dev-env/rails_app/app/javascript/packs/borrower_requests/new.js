
document.addEventListener('DOMContentLoaded', function() {
  $(".mask-money").val('');
  applyMasks();

  $('.mask-money').on('change', function() {
    const input_value = $(this).val()
    const value_to_numbers = input_value.replace(/\D/g,"")
    $('.loan_value').val(value_to_numbers);
  });


}, false);
  
function applyMasks() {
  let moneyBehavior = function (val) {
    return '#.##0,00'
  }

  $(".mask-money").mask(moneyBehavior, {reverse: true, onKeyPress: function(val, e, field, options) {
      field.mask(moneyBehavior.apply({}, arguments), options)
    }}).attr('maxlength', 15);

    $('.date').mask('00/00/0000');

}