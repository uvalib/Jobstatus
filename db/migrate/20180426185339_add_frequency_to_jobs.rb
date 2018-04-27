class AddFrequencyToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :frequency, :integer
  end
end
