class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string
    add_column :users, :bio, :text
    add_column :users, :private, :boolean
  end
end
