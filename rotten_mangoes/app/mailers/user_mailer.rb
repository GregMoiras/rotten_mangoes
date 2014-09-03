class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def delete_user_email(user)
    # binding.pry
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted')
  end
end
