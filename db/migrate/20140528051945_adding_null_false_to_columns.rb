class AddingNullFalseToColumns < ActiveRecord::Migration
  def change
    remove_column :runs, :description, :text
    add_column :runs, :description, :text, :null => false
    remove_column :users, :avatar, :string
    remove_column :users, :gender, :integer
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :fname, :string
    remove_column :users, :lname, :string
    add_column :users, :fname, :string, :null => false
    add_column :users, :lname, :string, :null => false
    add_column :users, :state, :string, :null => false
    add_column :users, :city, :string, :null => false
    add_column :users, :gender, :integer, :null => false
    add_column :users, :avatar, :string, :null => false
  end
end
