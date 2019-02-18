class ActionsController < ApplicationController
    def index
        if params[:captain_id]
            @actions = Captain.find(params[:captain_id]).actions
        else 
            @actions = Action.all
        end
    end

    def show
        @action = Action.find(params[:id])
        @ship = Ship.find(@action.ship_id)
        if params[:captain_id]
            @captain = Captain.find(params[:captain_id])
        end
    end

    def new
    end

    

end
