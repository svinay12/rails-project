
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
// import "./validate_address"
// import "./validate_properties"

