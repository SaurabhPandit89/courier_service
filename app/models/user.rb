# frozen_string_literal: true

# Model class for User data
class User < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :contact_detail, dependent: :destroy
  has_many :user_parcels
  has_many :parcels, through: :user_parcels

  accepts_nested_attributes_for :address, :contact_detail

  validates_presence_of :first_name, :last_name, :gender, :email,
                        :id_proof_type, :id_proof_number, :user_type

  scope :sender, -> { find_by(user_type: 'Sender') }
  scope :receiver, -> { find_by(user_type: 'Receiver') }
end
