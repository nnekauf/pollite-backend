class Api::V1::RepresentativesController < ApplicationController
  def show
   url = "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=#{zipcode}&key=API_KEY"
   response = HTTParty.get(url)
   render json: response
   # I left off by commenting out the route and trying to set up the controller action to successfully call the api with the zip code parameter provided by the front end
  end
end
