class ResponseMailer < ApplicationMailer
	def connect_request_mail
    	@user = params[:user]
    	@url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
