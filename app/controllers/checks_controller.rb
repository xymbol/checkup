class ChecksController < ApplicationController
  def update
    @place = Place.find_by! code: params[:place_id]
    @check = current_user.checks.where(place: @place).first_or_initialize
    @check.value = params[:value]
    @check.save!
    redirect_to root_url
  end
end
