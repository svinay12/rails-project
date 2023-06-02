// document.addEventListener("turbolinks:load", () => {
//   $(document).mouseover(function () {
//     alert('hello');
//     if($('#new_address_form').length == 1){
//       $('#new_address_form').validate({
//         rules: {
//           'property[land_area]':{
//             required: true,
//             minlength: 10,
//             maxlength: 15,
//             AreaRegex: true,
//           },
//         },
//         messages: {
//           'property[land_area]':{
//             required: 'Land area is required',
//             minlength: 'Minimum 10 character is required',
//             maxlength: 'Please enter real data in sqft ',
//             AreaRegex: 'Please enter valid area in sqft ',
//           }, 
//         }
//       })

//       $.validator.addMethod("AreaRegex", function (value, element) {
//         return this.optional(element) || /^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$/i.test(value)
//       },"Please Enter Valid zipcode");
//     } 
//   })
// })
