class Mailer < ActionMailer::Base
  default from: "info@leydekkers.com"
  
  def notification(recipient, post)
    @post  = post
    @user  = post.user.name
    @topic = post.topic
    
    mail to: recipient.email, subject: I18n.t('mailer.notification.subject')
  end
end
