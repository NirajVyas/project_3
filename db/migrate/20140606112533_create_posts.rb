class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :location
      t.string :date
      t.string :stayed
      t.string :tags
      t.text :body

      t.timestamps
    end
  end
end
