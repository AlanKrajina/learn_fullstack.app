class LessonsController < ApplicationController
    def new
      @lesson = Lesson.new
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
        binding pry
          if @lesson.save
            redirect_to lesson_path(@lesson)
          else
            render :new
          end
    end

    def show
        @lesson = Lesson.find_by(id: params[:id])
    #    if !@lesson
     #     redirect_to lessons_path
      #  end
    end


    private

    def lesson_params
        params.require(:lesson).permit(:title, :content)
    end
end
