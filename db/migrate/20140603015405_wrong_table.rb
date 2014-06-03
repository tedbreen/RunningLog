class WrongTable < ActiveRecord::Migration
  def change
    add_column :runs, :start_time, :time, :null => false
    remove_column :users, :start_time, :time
    add_index :runs, :start_time
  end
end
