class ReviewsController < ApplicationController
    
    
    def create
        @instructor = Instructor.find(params[:instructor_id])
        @review = @instructor.reviews.create(review_params)
        redirect_to instructor_path(@instructor) #send back to view instructor after review is posted where review will show
    end
    
    def show
        @review = Review.find(params[:id])
        respond_to do |format|
            format.json { render :json => @review.to_json(:include => :instructor) }
            format.html
        end
    end
    
    def destroy
        @instructor = Instructor.find(params[:instructor_id])
        @review = @instructor.reviews.find(params[:id])
        @review.destroy
        redirect_to instructor_path(@instructor)
    end
 
  private
    def review_params
        params.require(:review).permit(:rating, :comment)
    end
end
