class ChecksController < ApplicationController
  def update
    @place = Place.find_by! code: params[:place_id]
    @check = Check.search current_user, @place
    @check.value = params[:value]
    @check.save!
    redirect_to root_url
  end
end
