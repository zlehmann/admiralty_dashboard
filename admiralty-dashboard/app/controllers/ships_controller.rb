class ShipsController < ApplicationController
    before_action :require_login

    def index
        @ships = Ship.all
        respond_to do |f|
            f.html
            f.json {render json: @ships}
        end
    end
    
    def show
        @ship = Ship.find(params[:id])
        respond_to do |f|
            f.html
            f.json {render json: @ship}
        end
    end

    def new
        @ship = Ship.new(captain_id: params[:captain_id])
    end

    def create 
        #@ship = Ship.new(ship_params)
        #@ship.action = Action.find_or_create_by(action_type: "Newly commissioned")
        @action = Action.find_or_create_by(action_type: "Newly commissioned")
        @ship = @action.ships.build(ship_params)
        if @ship.save
            @ship.captain = Captain.find(params[:ship][:captain_id])
            redirect_to ship_path(@ship.id)
        else
            render :new 
        end
    end

    private

    def ship_params
        params.require(:ship).permit(:name, :guns, :class_type, :captain_id, :action_id)
    end

end
