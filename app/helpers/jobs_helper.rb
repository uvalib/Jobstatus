module JobsHelper
  def is_status_good(k)
    joblist = Job.where("name= ?", k).order("created_at DESC")
    job_condition = joblist.first["created_at"] + joblist.first["frequency"]*3600 >= Time.now  && joblist.first["status"] == "success"
    if job_condition == false
      UserMailer.with(user: @user).jobstatus_email.deliver_later(wait_until: 8.hours.from_now)
    end
    return job_condition
  end
end
