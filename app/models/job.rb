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
end
