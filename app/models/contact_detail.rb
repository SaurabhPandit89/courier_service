# frozen_string_literal: true

# Model class for Contact details
class ContactDetail < ApplicationRecord
  belongs_to :user

  validates_presence_of :phone_type, :phone_number
end
