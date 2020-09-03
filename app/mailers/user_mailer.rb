class UserMailer < ApplicationMailer
  default from: 'chaton-maton@outlook.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://monsite.fr/login' 
    mail(to: @user.email, subject: 'Welcome to our website !') 
  end
end
