class CaptainsController < ApplicationController
    def index
        @captains = Captain.all 
    end

    def show
        @captain = Captain.find(params[:id])
    end

end
