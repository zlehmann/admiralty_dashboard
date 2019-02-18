class CaptainsController < ApplicationController
    def index
        @captains = Captain.all 
    end

    def show
        @captain = Captain.find(params[:id])
    end

    def new
        @captain = Captain.new
    end

    def create
        @captain = Captain.new(captain_params)
        if @captain.save 
            redirect_to captain_path(@captain)
        else 
            render :new
        end
    end

    private

    def captain_params
        params.require(:captain).permit(:name, :age, :ship_id)
    end
end
