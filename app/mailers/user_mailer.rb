class UserMailer < ApplicationMailer
  default from:  'xw5d@virginia.edu'
  def jobstatus_email
    @user = ['xw5d@virginia.edu', 'md5wz@virginia.edu']
    @url = 'http://localhost:3000/jobs'
    mail(to: @user, subject: 'Job Status: There is a failed job')
  end
end
