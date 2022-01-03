class CreateParcelStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :parcel_statuses do |t|
      t.references :parcel, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
