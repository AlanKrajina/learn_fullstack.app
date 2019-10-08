class RatingsController < ApplicationController

	def new
		@lesson = Lesson.find(params["lesson_id"])
		@rating = @lesson.ratings.build
	end
	
	def create
		@lesson = Lesson.find(params["lesson_id"])
		@rating = @lesson.ratings.build
		if @rating.update(rating_params)
			respond_to do |format|
				format.html {redirect_to lesson_path(@lesson)}
				format.json {render json: @rating}
			end
		else
			flash.now[:message] = @rating.errors[:content][0]
			render :new
		end
    end
    
    private
    def rating_params
        params.require(:rating).permit(:lesson_id, :stars)
    end
end
