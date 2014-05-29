class RemoveStartTimeFromRuns < ActiveRecord::Migration
  def change
    remove_column :runs, :start_time, :time
  end
end
