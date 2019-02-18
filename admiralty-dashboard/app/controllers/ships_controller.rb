class ShipsController < ApplicationController
    before_action :require_login

    def index
        @ships = Ship.all
    end
    
    def show
        @ship = Ship.find(params[:id])
    end

    def new
        @ship = Ship.new 
    end

    def create 
        @ship = Ship.new(ship_params)
        @ship.captains << Captain.find(params[:ship][:captain_id])
        binding.pry
        if @ship.save
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
