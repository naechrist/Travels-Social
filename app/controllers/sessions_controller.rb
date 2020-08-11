class SessionsController < ApplicationController 

    def welcome
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to '/' 
    end 

    def new 
    end 

    def create 
        if params[:provider] 
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
       
        else 

            @user = User.find_by(username: params[:user][:username]) #try to find user in system 
            if @user && @user.authenticate(params[:user][:password]) #did we find someone and did they put in the right pass
                session[:user.id] = @user.id #store in session 
                redirect_to user_path(@user)
            else 
                flash[:error] = "Incorrect info, please try again."
                redirect_to login_path 
            end 
        end 
    end 


    private 

    def auth 
        request.env['omniauth.auth']
    end 
end 