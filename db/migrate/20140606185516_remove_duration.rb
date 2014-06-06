class RemoveDuration < ActiveRecord::Migration
  def change
    remove_column :runs, :duration, :float
  end
end
