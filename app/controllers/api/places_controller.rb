class Api::PlacesController < ApplicationController
  skip_before_action :authorize

  def ok
    render plain: pdf_urls.join("\n")
  end

  private

  def pdf_urls
    Place.ok.limit(1000).map(&:pdf_url)
  end
end
