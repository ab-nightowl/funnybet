class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def invit_friend(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Viens parier sur mon pari !')
  end
end
