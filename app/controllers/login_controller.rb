class LoginController < ApplicationController

    def new

    end

    def create
        @user = User.find_by_email(params[:email])
        puts params[:email]
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] =@user.id
            redirect_to '/'
        else
            redirect_to '/login/new'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login/new'
    end

end

