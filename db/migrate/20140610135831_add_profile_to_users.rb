class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display, :string
    add_column :users, :public_bio, :text
    add_column :users, :public, :boolean
  end
end
