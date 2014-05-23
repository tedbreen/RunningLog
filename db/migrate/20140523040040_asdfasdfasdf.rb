class Asdfasdfasdf < ActiveRecord::Migration
  def change
    remove_column :runs, :start_date, :date
    add_column :runs, :start_date, :date, null: false
  end
end
