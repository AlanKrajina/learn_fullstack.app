class LessonsController < ApplicationController
    accepts_nested_attributes_for :comment

    def new
      @lesson = Lesson.new
      @lesson.build_comment
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
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
        params.require(:lesson).permit(:title, :content, comment:[:id, :text])
    end
end
