class CaptainsController < ApplicationController
    def index
        @captains = Captain.all 
    end

    def show
        @captain = Captain.find(params[:id])
    end

    def new
    end

    def create
        @captain = Captain.create(captain_params)
        redirect_to captain_path(@captain)
    end

    private

    def captain_params
        params.require(:captain).permit(:name, :age, :ship_id)
    end
end
