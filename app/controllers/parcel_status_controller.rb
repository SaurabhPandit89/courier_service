# frozen_string_literal: true

# Controller class to update Parcel Status page
class ParcelStatusController < ApplicationController
  def create
    if ParcelStatus.create!({ parcel_id: parcel_status_params[:parcel_id],
                              status: ParcelStatus.status[parcel_status_params[:status].to_sym] })
      @parcel = Parcel.find(parcel_status_params[:parcel_id])
      redirect_to parcel_path(@parcel), notice: 'Parcel Status Updated'
    else
      render 'error'
    end
  end

  private

  def parcel_status_params
    params.permit(:parcel_id, :status)
  end
end
