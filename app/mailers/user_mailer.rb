class UserMailer < ApplicationMailer
  default from:  EMAIL_FROM
  def jobstatus_email
    @url = 'http://localhost:3000/jobs'
    mail(to: EMAIL_TO, subject: 'Job Status: There is a failed job')
  end
end
