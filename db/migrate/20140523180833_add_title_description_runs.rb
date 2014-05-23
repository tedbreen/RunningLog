class AddTitleDescriptionRuns < ActiveRecord::Migration
  def change
    add_column :runs, :title, :string, :null => false
    add_column :runs, :description, :text
  end
end
