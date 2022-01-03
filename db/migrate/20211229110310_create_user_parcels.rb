class CreateUserParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :user_parcels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parcel, null: false, foreign_key: true
      t.string :relation_type

      t.timestamps
    end
  end
end
