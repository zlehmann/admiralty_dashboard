class SessionsController < ApplicationController
    def new
        render :new 
    end

    def create
        session[:name] = params[:name]
        redirect_to '/'
    end

    def destroy
        session.delete :name 
    end
end