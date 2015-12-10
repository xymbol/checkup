class PlacesController < ApplicationController
  def show
    @place = Place.find_by! code: params[:id]
  end

  def index
    @places = Place.page params[:page]
  end

  def checked
    @places = Place.checked.page params[:page]
    render "index"
  end

  def ok
    @places = Place.send(action_name).page params[:page]
    render "index"
  end
  alias_method :not, :ok
end
