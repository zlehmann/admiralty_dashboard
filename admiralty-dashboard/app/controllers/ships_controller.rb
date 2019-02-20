class ShipsController < ApplicationController
    before_action :require_login

    def index
        @ships = Ship.all
    end
    
    def show
        @ship = Ship.find(params[:id])
    end

    def new
        @ship = Ship.new(captain_id: params[:captain_id])
    end

    def create 
        @ship = Ship.new(ship_params)
        if @ship.save
            @ship.captains << Captain.find(params[:ship][:captain_id])
            redirect_to ship_path(@ship.id)
        else
            render :new 
        end
    end

    private

    def ship_params
        params.require(:ship).permit(:name, :guns, :class_type, :captain_id)
    end

end
