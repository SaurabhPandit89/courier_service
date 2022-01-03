# frozen_string_literal: true

# Model class for Payment details
class PaymentDetail < ApplicationRecord
  belongs_to :parcel

  validates_presence_of :payment_mode, :service_mode
end
