# frozen_string_literal: true

# Model class for Parcel Status
class ParcelStatus < ApplicationRecord
  belongs_to :parcel

  validates_presence_of :status

  scope :latest, -> { order(:updated_at).last }

  def self.status
    {
      created: 'Created',
      dispatched: 'Dispatched',
      in_transit: 'In Transit',
      out_for_delivery: 'Out for Delivery',
      delivered: 'Delivered',
      returned: 'Returned',
      failed: 'Failed',
      not_deliverable: 'Not Deliverable'
    }
  end
end
