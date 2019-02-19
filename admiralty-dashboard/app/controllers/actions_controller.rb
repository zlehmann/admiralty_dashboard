class ActionsController < ApplicationController
    before_action :require_login
    
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
        @action = Action.new
    end

    def create
        binding.pry
        action_type = params[:action_type]
        ship = params[:ship_id]
        @action = Action.new(action_type: action_type, ship_id: ship)
        if @action.save 
            redirect_to action_path(@action)
        else 
            render :new
        end
    end

    private

    #def action_params
    #    params.require(:action).permit(:action_type, :ship_id)
    #end

end
