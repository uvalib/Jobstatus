class AddDefaultValueToFrequency < ActiveRecord::Migration[5.2]
  def change
    change_column_null :jobs, :frequency, false
    change_column_null :jobs, :name, false
    change_column_default :jobs, :frequency, from: nil, to:24
    change_column_default :jobs, :name, from: nil, to:"NO NAME"
  end
end
