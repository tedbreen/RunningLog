class RemoveSneakerColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :runs, :sneaker_id, :integer
  end
end
