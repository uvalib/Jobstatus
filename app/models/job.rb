class Job < ApplicationRecord
   validates :status, inclusion: { in: %w(success failed),
                                   message: ->(object, data) do
                                     "#{object.name} is not a valid status, please use 'failed' or 'success'. "
                                   end
   }
   validates :frequency, :numericality => true, :allow_nil => false
   validates :name, presence: true, allow_blank: false

   def self.is_status_good(k)
     joblist = Job.where("name= ?", k).order("created_at DESC")
     job_condition = joblist.first["created_at"] + joblist.first["frequency"]*3600 >= Time.now  && joblist.first["status"] == "success"
     return job_condition
   end

   def self.all_statuses
     all_statuses = Hash.new()
     jobs = Job.select("name").distinct
     (0..jobs.count-1).each do |i|
       all_statuses[jobs[i].name] = Job.is_status_good(jobs[i].name)
     end
     return all_statuses
   end
end
