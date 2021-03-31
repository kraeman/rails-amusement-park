class UsersController < ApplicationController
    def new
        @user = User.new
        render "users/signup"
    end

    def create
        user = User.create(user_params)
        session[:user] ||= {}
        session[:user_id] = user.id
        if user
            redirect_to user_path(user)
        else
            redirect_to 'users/signup'
        end
    end

    def show
  
        @user = User.find_by_id(session[:user_id])
        if @user
            render 'users/show'
        else
            redirect_to 'session/signin'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end
end
