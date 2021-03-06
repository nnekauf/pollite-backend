class Api::V1::RepresentativesController < ApplicationController
  
  def index
    url = "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=07307&key=#{ENV["API_KEY"]}"
    response = HTTParty.get(url)
    
    render json: response   
  end

  def show
  # binding.pry
  url = "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=#{params[:id]}&key=#{ENV["API_KEY"]}"
  response = HTTParty.get(url)
  # binding.pry
  city = response["normalizedInput"]["city"]
  state = response["normalizedInput"]["state"]
  zip = response["normalizedInput"]["zip"]
  # name = response["offices"][0]["name"]
  # index = response["offices"][0]["officialIndices"]
  # find the official whose index number equals the officvialindices value within the offices array
  # index = response["offices"].map {|n| n["officialIndices"]}
  # name = response["offices"].map {|n| n["name"]}
  offices = {}
  response["offices"].map {|n| offices[n["name"]] = n["officialIndices"]}
  # response["officials"].map{|o| o["name"]}
  # name = response["offices"].map {|n| n["name"]}
  # person = response["offices"].map {|p| p.map {|k, v| k v if k == "name" || k == "officialIndices"}}
  # offices = {name: name, indicies: index}
  
  officials = response["officials"].map{|o| o["name"]}
  # binding.pry
  # person = 
  # render json: {city: city, state: state, zipcode: zip, officials: officials}
  # render json: officials
  render json: {officials: officials, city: city, state: state, zipcode: zip}
  binding.pry

  # response = HTTParty.get("https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=#{params[:id]}&key=#{ENV["API_KEY"]}",
  #   :body { :officers}
  #   ).to_json
  # render json: response
  #  # I left off by commenting out the route and trying to set up the controller action to successfully call the api with the zip code parameter provided by the front end
  end

private
  def representative_params

    params.require(:representative). permit(:zipcode, :id)
  end
end
