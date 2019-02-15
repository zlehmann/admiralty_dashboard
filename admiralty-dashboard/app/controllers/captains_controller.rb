class CaptainsController < ApplicationController
    def index
        @captains = Captain.all 
    end

end
