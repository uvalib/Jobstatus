# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def jobstatus_email_preview
    UserMailer.jobstatus_email
  end
end
