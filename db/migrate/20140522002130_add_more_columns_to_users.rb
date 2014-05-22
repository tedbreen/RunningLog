class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    
    add_index :users, :city
    add_index :users, :state
    add_index :users, :fname
    add_index :users, :lname
  end
end
