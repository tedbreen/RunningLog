class AddNullFalseDistance < ActiveRecord::Migration
  def change
    remove_column :runs, :distance, :float
    add_column :runs, :distance, :float, :null => false

    add_index :runs, :distance
  end
end
