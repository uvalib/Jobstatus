class Job < ApplicationRecord
   validates :status, inclusion: { in: %w(success failed),
                                   message: ->(object, data) do
                                     "#{object.name} is not a valid status, please use 'failed' or 'success'. "
                                   end
   }
   validates :frequency, :numericality => true, :allow_nil => false
   validates :name, presence: true, allow_blank: false
end
