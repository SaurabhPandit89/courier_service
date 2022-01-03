class CreatePaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_details do |t|
      t.references :parcel, null: false, foreign_key: true
      t.string :payment_mode
      t.string :service_mode

      t.timestamps
    end
  end
end
