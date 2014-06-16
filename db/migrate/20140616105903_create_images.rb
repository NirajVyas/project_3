class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :post_id
      t.string :photo_file
      t.timestamps
    end
  end
end
