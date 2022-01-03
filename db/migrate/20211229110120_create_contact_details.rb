class CreateContactDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone_type
      t.string :country_code
      t.string :city_code
      t.string :phone_number

      t.timestamps
    end
  end
end
