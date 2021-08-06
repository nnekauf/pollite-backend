class Api::V1::RepresentativesController < ApplicationController
  
  def index
    url = "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=07307&key=#{ENV["API_KEY"]}"
    response = HTTParty.get(url)
    
    render json: response   
  end

  def show
  
  url = "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=#{params[:id]}&key=#{ENV["API_KEY"]}"
  response = HTTParty.get(url)
  city = response["normalizedInput"]["city"]
  state = response["normalizedInput"]["state"]
  zip = response["normalizedInput"]["zip"]
  name = response["offices"][0]["name"]
  index = response["offices"][0]["officialIndices"]
  # office = {name: response["offices"]["name"], index: response["offices"]["officialIndices"]}
  
  officials = response["officials"]
  render json: {city: city, state: state, zipcode: zip, offices: {name:name, index: index}, officials: officials}
  # binding.pry

  # response = HTTParty.get("https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=#{params[:id]}&key=#{ENV["API_KEY"]}",
  #   :body { :officers}
  #   ).to_json
  # render json: response
  #  # I left off by commenting out the route and trying to set up the controller action to successfully call the api with the zip code parameter provided by the front end
  end
end
