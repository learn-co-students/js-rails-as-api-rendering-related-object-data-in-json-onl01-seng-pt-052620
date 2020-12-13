class SightingsController < ApplicationController

    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting.to_json(include: [:bird, :location])
    end

end
