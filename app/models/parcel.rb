# frozen_string_literal: true

require 'securerandom'

# Model class for Parcel data
class Parcel < ApplicationRecord
  has_one :payment_detail, dependent: :destroy
  has_many :user_parcels, dependent: :destroy
  has_many :users, through: :user_parcels, dependent: :destroy
  has_many :parcel_statuses, dependent: :destroy

  validates_presence_of :parcel_type, :weight, :tracking_number
  validates_uniqueness_of :tracking_number

  accepts_nested_attributes_for :users, :payment_detail

  before_validation :set_tracking_number
  after_create :create_parcel_status

  def self.track(tracking_number)
    where(tracking_number: tracking_number)
  end

  private

  def create_parcel_status
    parcel_status = parcel_statuses.build
    parcel_status.parcel_id = self.id
    parcel_status.status = ParcelStatus.status[:created]
    parcel_status.save
  end

  def set_tracking_number
    self.tracking_number = 1000000000000 + SecureRandom.random_number(100000000)
  end
end
