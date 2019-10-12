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
        render :error2
      end
    end
    
    def show
      @user = User.find_by(:id => params[:id])
     if  @lesson = Lesson.find_by(id: params[:id])
      @lesson.user.id = @user.id
     end
    end
  

    def best_users
      @users = User.joins(:lessons).group(:id).order('COUNT(lessons.id) DESC').limit(5)
    end


    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
