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
        @new_action = Action.new
    end

    def create
        @new_action = Action.new(action_type: params[:action_type], ship_id: params[:action_ship][:ship_id])
        if @new_action.save 
            redirect_to action_path(@new_action)
        else 
            render :new
        end
    end

    private
    #wasn't able to get strong params to work on new action form.
    def action_params
        params.require(:new_action).permit(:action_type, :ship_id)
    end

end
