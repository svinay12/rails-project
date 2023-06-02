document.addEventListener("turbolinks:load", () => {
  $(document).mouseover(function () {
    if($('#userform').length == 1){
      $('#userform').validate({
        rules: {
          'user[name]':{
            required: true,
            minlength: 3,
            maxlength: 40,
            UserNameRegex: true
          },
          'user[mobile]':{
            required: true,
            minlength: 10,
            maxlength: 15,
            UserMobileRegex: true
          },
      
          'user[email]':{
            required:true,
            EmailRegex: true
          },
        
        },
        messages: {
          'user[name]':{
            required: 'User name is required',
            minlength: 'Minimum 5 character is required',
            maxlength: 'Please enter small name',
            UserNameRegex: 'Please enter valid name'
          },
          'user[mobile]':{
            required: 'User number is required',
            minlength: 'Enter atleast 10 number',
            maxlength: 'Not a valid number',
            UserMobileRegex: 'Enter valid mobile number'
          },
          'user[email]':{
            required: 'User email is required',
            EmailRegex: 'Enter a valid email'
          },         
        }
      })
      $.validator.addMethod("UserNameRegex", function (value, element) {
        return this.optional(element) || /^[a-zA-Z ]*$/i.test(value)
      },"Please Enter Valid Name");
      $.validator.addMethod("UserMobileRegex", function (value, element) {
        return this.optional(element) || /^(0|91)?[6-9][0-9]{9}$/i.test(value)
      },"Please Enter Valid number");
      $.validator.addMethod("EmailRegex", function (value, element) {
        return this.optional(element) || /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/i.test(value)
      },"Please Enter Valid email");

    } 
  })
})