# frozen_string_literal: true

# Controller class for Parcel functionality
class ParcelsController < ApplicationController
  before_action :set_parcel, only: %i[edit update show destroy]
  before_action :cancel_redirect, only: %i[create update]

  def index
    @parcels = Parcel.all.order(:updated_at)
  end

  def new
    @parcel = Parcel.new
    2.times { @parcel.users.build }
  end

  def create
    @parcel = Parcel.new(parcel_params)
    if @parcel.save
      redirect_to parcels_path, notice: 'Parcel Created Successfully'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @parcel.update(parcel_params)
      redirect_to parcels_path, notice: 'Parcel Updated Successfully'
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    if @parcel.destroy
      redirect_to parcels_path, notice: 'Parcel Deleted Successfully'
    else
      render 'index'
    end
  end

  private

  def cancel_redirect
    redirect_to parcels_path if params[:cancel]
  end

  def set_parcel
    @parcel = Parcel.find(params[:id])
  end

  def parcel_params
    params.require(:parcel).permit(:parcel_type, :weight, :content, :is_delivered,
                                    users_attributes: [:id, :first_name, :middle_name, :last_name, 
                                    :gender, :id_proof_type, :id_proof_number, :email, :user_type,
                                    address_attributes: [:id, :address_line1, :address_line2, :address_line3, :city, :pincode, :state, :country],
                                    contact_detail_attributes: [:id, :phone_type, :country_code, :city_code, :phone_number]],
                                    payment_detail_attributes: [:id, :payment_mode, :service_mode])
  end
end
