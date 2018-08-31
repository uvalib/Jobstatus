namespace :email_notification do
  desc 'Send email notification if there is a failed or delayed job'
  task :send_email => :environment do
    if Job.all_statuses.has_value?(false)
      puts "Sending emails to #{ENV['RECEIVER']}"
      UserMailer.with(user: ENV['RECEIVER']).jobstatus_email.deliver_now
    else
      puts "All jobs are ok. Base Url=#{ENV['BASE_URL']}"
    end
  end
end

