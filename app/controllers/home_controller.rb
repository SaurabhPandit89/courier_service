# frozen_string_literal: true

# Controller class for home page
class HomeController < ApplicationController
  def index; end

  def track
    @parcel = Parcel.track(tracking_params[:tracking_number])
  end

  private

  def tracking_params
    params.require(:track).permit(:tracking_number)
  end
end
