class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to place_url(id: random_id)
    else
      render
    end
  end

  def random_id
    @random_id ||= Place.random_id
  end
end
