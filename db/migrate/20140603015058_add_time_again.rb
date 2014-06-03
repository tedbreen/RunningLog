class AddTimeAgain < ActiveRecord::Migration
  def change
    add_column :users, :start_time, :time
  end
end
