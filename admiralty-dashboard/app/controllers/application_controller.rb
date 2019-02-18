class ApplicationController < ActionController::Base

    def require_login 
        #return head(:forbidden) unless session.include? :user_id
        unless session.include? :user_id
            render "sessions/forbidden"
        end
    end

    private
    
    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    helper_method :current_user
end
