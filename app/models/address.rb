# frozen_string_literal: true

# Model class for Address data
class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :address_line1,
                        :city, :state, :pincode, :country
end
