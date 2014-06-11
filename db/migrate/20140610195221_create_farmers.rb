class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.text :farm
      t.text :produce
      t.integer :produce_price
      t.string :wepay_access_token
      t.integer :wepay_account_id

      t.timestamps
    end
  end
end
