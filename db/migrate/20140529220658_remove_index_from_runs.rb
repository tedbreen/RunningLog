class RemoveIndexFromRuns < ActiveRecord::Migration
  def change
    add_index :runs, :start_date
  end
end
