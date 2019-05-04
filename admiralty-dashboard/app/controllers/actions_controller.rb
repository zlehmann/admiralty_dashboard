class ActionsController < ApplicationController
    before_action :require_login
    
    def index
        if params[:captain_id]

            @actions = Captain.find(params[:captain_id]).actions
        else 
            @actions = Action.all
        end

        if params[:action_filter] == "Battles"
            @actions = @actions.battles
        elsif params[:action_filter] == "Captures"
            @actions = @actions.captures 
        end

        respond_to do |f|
            f.html
            f.json {render json: @actions}
        end
    end

    def show
        @action = Action.find(params[:id])
        @ships = @action.ships
        if params[:captain_id]
            @captain = Captain.find(params[:captain_id])
        end
        respond_to do |f|
            f.html
            f.json {render json: @action}
        end
    end

    def new
        @new_action = Action.new
    end

    def create
        @new_action = Action.find_or_create_by(action_type: params[:action_type])
        ship = Ship.find(params[:action_ship][:ship_id])
        @new_action.ships << ship
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
