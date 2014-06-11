class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.text :body
      t.float :amount
      t.string :picture
      t.string :video

      t.timestamps
    end
  end
end
