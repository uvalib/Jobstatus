class AddDefaultValueToFrequency < ActiveRecord::Migration[5.2]
  def change
    change_column_null :jobs, :frequency, false
    change_column_default :jobs, :frequency, from: nil, to:24
  end
end
