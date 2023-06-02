
import "bootstrap"
import "../stylesheets/application" 
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-validation")
require("jquery")

window.jQuery = $;
window.$ = $;

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

// $('#new_address_form').validate({
//         rules: {
//           'address[zipcode]':{
//             required: true,
//             minlength: 10,
//             maxlength: 15,
//           },
//           'address[plot_no]':{
//             required: true,
//           },
//           'address[locality]':{
//             required: true,
//           },
//           'address[city]':{
//             required: true,
//           },
//           'address[state]':{
//             required: true,
//           },
//         },
//         messages: {
//           'address[zipcode]':{
//             required: 'Zip code is required',
//             minlength: 'Minimum 10 character is required',
//             maxlength: 'Please enter small name',
//           },
//           'address[plot_no]':{
//             required: 'Plot number is required',
//           },
//           'address[city]':{
//             required: 'City is required',
//           },
//           'address[state]':{
//             required: 'State is required',
//           },
//           'address[locality]':{
//             required: 'Locality is required',
//           },      
//         }
//       })


