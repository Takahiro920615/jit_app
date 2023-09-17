class UserMailer < ApplicationMailer
  def registration_confirmation(user)
    @user = user
    mail(to: user.email, subject: "メールアドレス確認メール")
  end

  def confirmation_instructions(user)
    @user = user
    mail(to: user.email, subject: "確認メールです")
  end
end