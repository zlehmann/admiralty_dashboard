class ShipsController < ApplicationController
    before_action :require_login

    def index
        @ships = Ship.all
    end
    
    def show
        @ship = Ship.find(params[:id])
    end
end
