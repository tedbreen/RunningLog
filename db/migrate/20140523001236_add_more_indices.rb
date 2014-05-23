class AddMoreIndices < ActiveRecord::Migration
  def change
    add_index :users, :gender
  end
end
