class UserMailer < ApplicationMailer
  default from:  ENV['SENDER']
  def jobstatus_email
    @url = []
    Job.all_statuses.each{|k,v| @url << (ENV['BASE_URL'].nil? ? 'http://localhost:3000': ENV['BASE_URL'])+'/jobs/group?name='+ k if v == false }
    mail(to: ENV['RECEIVER'], subject: 'Job Status: There is a failed job')
  end
end
