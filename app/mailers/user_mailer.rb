class UserMailer < ApplicationMailer
	default from: 'dbp2015studyproject@gmx.de'

	def welcome_email(user)
		@user = user
		@url  = 'http://plays.herokuapp.com/login'
		mail(to: @user.email, subject: 'Willkommen!')
	end

	def reset_password_email(user)
		@user = User.find user.id
		@url  = edit_password_reset_url(@user.reset_password_token)
		mail(:to => @user.email, :subject => "Ihr Passwort wurde zurückgesetzt")
	end
end
