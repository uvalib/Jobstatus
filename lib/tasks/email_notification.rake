namespace :email_notification do
  desc 'Send email notification if there is a failed or delayed job'
  task :send_email => :environment do
    if Job.is_status_good(ENV['name']) == false
      puts Job.is_status_good(ENV['name'])
      UserMailer.with(user: EMAIL_TO).jobstatus_email.deliver_now
    end
  end
end

