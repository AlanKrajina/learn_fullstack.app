class UsersController < ApplicationController
 
    def new
        @user = User.new
    end
    
    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:errors] = @user.errors.full_messages

        render :error2
      end
    end
    
    def show
      @user = User.find_by(:id => params[:id])
    end
  

    def best_users
      @users = User.joins(:lessons).group(:id).order('COUNT(lessons.id) DESC').limit(5)
    end


    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
