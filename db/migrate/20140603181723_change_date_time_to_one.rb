class ChangeDateTimeToOne < ActiveRecord::Migration
  def change
    remove_column :runs, :start_time, :time
    remove_column :runs, :start_date, :datetime
    add_column :runs, :time_date, :datetime, :null => false
    add_index :runs, :time_date
  end
end
