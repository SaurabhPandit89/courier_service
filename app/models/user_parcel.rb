# frozen_string_literal: true

# Model class for User parcel data
class UserParcel < ApplicationRecord
  belongs_to :user
  belongs_to :parcel

  validates_presence_of :user_id, :parcel_id
end
