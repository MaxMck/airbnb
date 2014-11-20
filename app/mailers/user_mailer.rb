class UserMailer < ActionMailer::Base
  default from: 'welcome@airvnv.com'

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Airvnv! How to get started')
    # This will render a view in `app/views/user_mailer`!
  end
end