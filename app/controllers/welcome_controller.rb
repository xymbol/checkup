class WelcomeController < ApplicationController
  skip_before_action :authorize, only: %i(index)

  def index
    if current_user && random_id
      redirect_to place_url(id: random_id)
    end
  end

  private

  def random_id
    @random_id ||= Place.random_id
  end
end
