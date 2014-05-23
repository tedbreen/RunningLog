class IntToDec < ActiveRecord::Migration
  def change
    remove_column :runs, :duration, :integer
    add_column :runs, :duration, :decimal
  end
end
