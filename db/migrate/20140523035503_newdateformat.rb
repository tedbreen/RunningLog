class Newdateformat < ActiveRecord::Migration
  def change
    add_column :runs, :start_date, :date
  end
end
