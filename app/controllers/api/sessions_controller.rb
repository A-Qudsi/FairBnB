class Api::SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        
        if @user 
            login_user!(@user)
            render "api/users/show"
        else 
            render json: ['Invalid Username or Password'], status: 422
        end
        
    end

    def destroy
        logout!
        render json: {}
    end

end