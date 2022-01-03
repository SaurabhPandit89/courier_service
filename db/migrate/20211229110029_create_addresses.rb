class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :landmark
      t.integer :pincode
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
