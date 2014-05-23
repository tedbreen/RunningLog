class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer  :user_id, :null => false
      t.date     :date, :null => false
      t.time     :start_time, :null => false
      t.integer  :type, :null => false
      t.decimal  :distance, :null => false
      t.integer  :duration
      t.string   :city, :null => false
      t.string   :state, :null => false
      t.integer  :sneaker_id

      t.timestamps
    end

    add_index :runs, :user_id
    add_index :runs, :date
    add_index :runs, :start_time
    add_index :runs, :type
    add_index :runs, :distance
    add_index :runs, :duration
    add_index :runs, :city
    add_index :runs, :state
    add_index :runs, :sneaker_id
  end
end
