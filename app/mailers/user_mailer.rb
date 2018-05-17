class UserMailer < ApplicationMailer
  default from:  EMAIL_FROM
  def jobstatus_email
    @url = []
    Job.all_statuses.each{|k,v| @url << BASE_URL+'/jobs/group?name='+ k if v == false }
    mail(to: EMAIL_TO, subject: 'Job Status: There is a failed job')
  end
end
