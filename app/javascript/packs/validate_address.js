document.addEventListener("turbolinks:load", () => {
  $(document).mouseover(function () {
    alert('hello');
    if($('#new_address_form').length == 1){
      $('#new_address_form').validate({
        rules: {
          'address[zipcode]':{
            required: true,
            minlength: 10,
            maxlength: 15,
            AddressZipCodeRegex: true,
          },
          'address[plot_no]':{
            required: true,
          },
          'address[locality]':{
            required: true,
          },
          'address[city]':{
            required: true,
          },
          'address[state]':{
            required: true,
          },

        },
        messages: {
          'address[zipcode]':{
            required: 'Zip code is required',
            minlength: 'Minimum 10 character is required',
            maxlength: 'Please enter small name',
            AddressZipCodeRegex: 'Please enter valid name',
          },
          'address[plot_no]':{
            required: 'Plot number is required',
          },
          'address[city]':{
            required: 'City is required',
          },
          'address[state]':{
            required: 'State is required',
          },
          'address[locality]':{
            required: 'Locality is required',
          },      
        }
      })

      $.validator.addMethod("AddressZipCodeRegex", function (value, element) {
        return this.optional(element) || /^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$/i.test(value)
      },"Please Enter Valid zipcode");
    } 
  })
})