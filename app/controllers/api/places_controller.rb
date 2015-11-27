class Api::PlacesController < ApplicationController
  skip_before_action :authorize

  def ok
    render plain: pdf_urls.join("\n")
  end

  private

  def pdf_urls
    Place.ok.map(&:pdf_url)
  end
end
