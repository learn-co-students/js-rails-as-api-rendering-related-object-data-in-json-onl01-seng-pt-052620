class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
    # Also written explicitly as 
    # render json: sightings.to_json(include: [:bird, :location])

  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    
    if sighting
      render json: sighting.to_json(include: [:bird, :location])
      # if you wanted to just exclude a certain attribute
      # render json: sighting, include: [:bird, :location], except: [:updated_at]

      # or for more complicated specifics, showing only specific attributes per object
      # render json: sighting.to_json(:include => {
      #   :bird => {:only => [:name, :species]},
      #   :location => {:only => [:latitude, :longitude]}
      # }, :except => [:updated_at])
    

    else
      render json: { message: 'No sighting found with that id' }
    end
  
  end


end
