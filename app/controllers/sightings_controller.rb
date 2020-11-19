class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end
  def show
    sighting = Sighting.find_by_id(params[:id])
    sighting ? (render json: sighting, include: [:bird, :location]) : (render json: { message: 'No sighting found with that id' })
  end
end
