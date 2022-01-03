class AddColumnTrackingNumberInParcels < ActiveRecord::Migration[6.1]
  def change
    add_column :parcels, :tracking_number, :string
  end
end
