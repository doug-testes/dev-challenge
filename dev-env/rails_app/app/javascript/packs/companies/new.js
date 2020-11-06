
document.addEventListener('DOMContentLoaded', function() {
  $(".mask-money").val('');
  applyMasks()
}, false);
  
function applyMasks() {
    $(".cnpj-field").mask("00.000.000/0000-00")


    let phoneBehavior = function (val) {
      return val.replace(/\D/g, '').length === 11 ? '(00) 0 0000-0000' : '(00) 0000-00009'
    }
    $('.phone-field').mask(phoneBehavior, { onKeyPress: function(val, e, field, options) {
      field.mask(phoneBehavior.apply({}, arguments), options)
    }})



    $(".cep-field").mask("99999-999", {
      onComplete: function () {
        var cep = $('.cep-field').val().replace(/[^0-9]/, "")


        // Validação do CEP; caso o CEP não possua 8 números, então cancela
        // a consulta
        if (cep.length != 8) {
          return false
        }

        // A url de pesquisa consiste no endereço do webservice + o cep que
        // o usuário informou + o tipo de retorno desejado (entre "json",
        // "jsonp", "xml", "piped" ou "querty")
        var url = "https://viacep.com.br/ws/" + cep + "/json/"

        $.getJSON(url, function (dadosRetorno) {
          try {
            // Preenche os campos de acordo com o retorno da pesquisa
            $(".street").val(dadosRetorno.logradouro)
            $(".neighbourhood	").val(dadosRetorno.bairro)
            $(".city").val(dadosRetorno.localidade)
            $(".state").val(dadosRetorno.uf)
            $(".number").focus()
          } catch (ex) {
          }
        })
      }
    })

}