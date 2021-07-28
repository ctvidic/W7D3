class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end
   
    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.create(user_params)
        
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end




    protected
    def user_params
        params.require(:user).permit(:username,:password)
    end
end