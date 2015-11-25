class WelcomeController < ApplicationController
  skip_before_action :authorize, only: %i(index)

  def index
    if current_user && random_code
      redirect_to place_url(id: random_code)
    end
  end

  private

  def random_code
    @random_code ||= Place.random_code
  end
end
