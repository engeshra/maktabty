class UserMailer < ActionMailer::Base
    default :from => "maktabtyapp@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Registered at Maktabty")
  end
end
