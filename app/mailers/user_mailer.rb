class UserMailer < ApplicationMailer
  default from:  EMAIL_FROM
  def jobstatus_email
    @url = []
    Job.all_statuses.each{|k,v| @url << (ENV['BASE_URL'].nil? ? 'http://localhost:3000': ENV['BASE_URL'])+'/jobs/group?name='+ k if v == false }
    @url.inspect
    mail(to: EMAIL_TO, subject: 'Job Status: There is a failed job')
  end
end
