class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :status
      t.integer :duration
      t.text :message

      t.timestamps
    end
  end

  #def up

  #end
  #def down

  #end
end
