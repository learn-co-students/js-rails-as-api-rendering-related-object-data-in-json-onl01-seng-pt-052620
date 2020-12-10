class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
      end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, include: [:bird, :location], except: [:updated_at] 
        else
            render json: { message: 'No sighting found with that id' }
        end 
    end 
    #alternative is to use the `include` option to indicate what models you want to nest
    #if we wanted to remove the #`:updated_at` attribute from #`Sighting` when rendered use `except`
    #Using the fully written #`to_json` render statement
    #can help keep things a bit more #readable here:
    #def show
    #    sighting = Sighting.find_by#(id: params[:id])
    #    render json: sighting.to_json#(:include => {
    #      :bird => {:only => [:name, #:species]},
    #      :location => {:only => #[:latitude, :longitude]}
    #    }, :except => [:updated_at])
    #  end

end
