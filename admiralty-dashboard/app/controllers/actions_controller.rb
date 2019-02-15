class ActionsController < ApplicationController

    def index
        if params[:captain_id]
            @actions = Captain.find(params[:captain_id]).actions
        else 
            @actions = Action.all
        end
    end

end
