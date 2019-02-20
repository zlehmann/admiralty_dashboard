class SessionsController < ApplicationController
    def new
        render :new 
    end

    def create
        if auth_hash
            @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
                u.name = auth_hash['info']['name']
                u.provider = auth_hash['provider']
                u.id = auth_hash['uid']
            end
            @user.save
            session[:user_id] = @user.id
            binding.pry
            redirect_to user_path(@user.id)
        else
            @user = User.find_by(name: params[:session][:name])
            if @user && @user.authenticate(params[:session][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user.id)
            else
                @error = "Incorrect user/password combination."
                render :new
            end
        end
    end

    def destroy
        session.delete :user_id 
        redirect_to login_path
    end

    def forbidden
        render :forbidden 
    end

    private

    def auth_hash
        request.env['omniauth.auth']
    end
end