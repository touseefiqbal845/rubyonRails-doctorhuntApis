class UserMailer < ApplicationMailer
    default from: ENV['EMAIL_USER']
  
    def reset_password_email(user)
      @user = user
      @reset_link = "http://localhost:3000/reset-password?token=#{@user.reset_password_token}&email=#{@user.email}"
      mail(to: @user.email, subject: 'Reset Your Password')
    end
  end
  