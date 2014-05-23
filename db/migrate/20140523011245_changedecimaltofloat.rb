class Changedecimaltofloat < ActiveRecord::Migration
  def change
    remove_column :runs, :duration, :decimal
    remove_column :runs, :distance, :decimal
    add_column :runs, :duration, :float
    add_column :runs, :distance, :float

    add_index :runs, :distance
    add_index :runs, :duration
  end
end
