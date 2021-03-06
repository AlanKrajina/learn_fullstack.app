class LessonsController < ApplicationController

    def new
      @lesson = Lesson.new
      @lesson.build_comment
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
          if @lesson.save
           # redirect_to lesson_path(@lesson)
           render json: @lesson
          else
            render :new
          end
    end

    def show
        @lesson = Lesson.find_by(id: params[:id])
        respond_to do |f|
          f.html
          f.json {render json: @lesson}
        end
    end

    def index
      if params[:user_id]
        @lessons = User.find(params[:user_id]).lessons
      elsif params[:title]
        @lessons = Lesson.search_by_title(params[:title])
      else
        @lessons = Lesson.all
        respond_to do |f|
          f.html
          f.json {render json: @lessons}
        end
      end
    end



    def edit
      @lesson = Lesson.find_by(id: params[:id])
    end
  
    def update
      @lesson = Lesson.find_by(id: params[:id])
      if @lesson.update(lesson_params)
        redirect_to lesson_path(@lesson)
      else
        render :edit
      end
    end
  
    def destroy
      @lesson = Lesson.find_by(id: params[:id])
      @lesson.destroy
      redirect_to user_path(current_user)
    end

    private

    def lesson_params
        params.require(:lesson).permit(:title, :content, comment_attributes: [:text])
    end
end
