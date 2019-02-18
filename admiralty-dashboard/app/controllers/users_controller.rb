class UsersController < ApplicationController


    def show
        if params[:captain_id]
            @captains
        end 
    end

end
