class ChangeNameOfRunType < ActiveRecord::Migration
  def change
    rename_column :runs, :type, :run_type
  end
end
