class EditRuncols < ActiveRecord::Migration
  def change
    remove_column :runs, :date, :date
  end
end
