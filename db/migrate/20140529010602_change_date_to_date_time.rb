class ChangeDateToDateTime < ActiveRecord::Migration
  def change
    remove_column :runs, :start_date, :date
    add_column :runs, :start_date, :datetime, :null => false
  end
end
