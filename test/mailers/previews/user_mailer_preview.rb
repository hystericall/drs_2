# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def account_activation
    @manager = User.first
    @user = User.second
    UserMailer.account_activation @user, @manager
  end

  def password_reset
    @user = User.first
    @user.reset_token = User.new_token
    UserMailer.password_reset @user
  end
end
