class PlacesController < ApplicationController
  before_action :find_place, only: %i(show ok not)

  def show
  end

  def ok
    @check = Check.where(place: @place, user: current_user).first_or_initialize
    @check.value = action_name
    @check.save!
    redirect_to root_url
  end
  alias_method :not, :ok

  def index
    @places = Place.page params[:page]
  end

  def checked
    @places = Place.checked.page params[:page]
    render "index"
  end

  private

  def find_place
    @place = Place.find_by! code: params[:id]
  end
end
