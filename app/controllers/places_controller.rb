class PlacesController < ApplicationController
  before_action :find_place

  def show
  end

  def ok
    @check = Check.where(place: @place, user: current_user).first_or_initialize
    @check.value = action_name
    @check.save!
    redirect_to root_url
  end
  alias_method :not, :ok

  private

  def find_place
    @place = Place.find_by! code: params[:id]
  end
end
