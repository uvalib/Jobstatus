json.extract! job, :id, :name, :status, :duration, :message, :created_at, :updated_at
json.url job_url(job, format: :json)
