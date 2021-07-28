class UsersController < ApplicationController

    def new
        # @users = User.all
        render :new
    end

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

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)  
        else
            flash.now[:errors] = @user.errors.full_messages
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    

    protected
    def user_params
        params.require(:user).permit(:username,:password)
    end
end