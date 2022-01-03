class CreateParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :parcels do |t|
      t.string :parcel_type
      t.string :weight
      t.text :content
      t.boolean :is_delivered

      t.timestamps
    end
  end
end
