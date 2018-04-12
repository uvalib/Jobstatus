class Job < ApplicationRecord
   validates :status, inclusion: { in: %w(success failed),
                                   message: ->(object, data) do
                                     "#{object.name} is not a valid status, please use 'failed' or 'success'. "
                                   end
   }
end
