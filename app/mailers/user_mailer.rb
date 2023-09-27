class UserMailer < ApplicationMailer
  default from: 'moviereviewapp@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://127.0.0.1:3000'
    mail(to: @user.email, subject: 'Welcome to the Movie Review Applicationrails generate job SendSignupEmail')
  end
end
