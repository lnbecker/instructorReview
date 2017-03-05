class InstructorsController < ApplicationController
    def index
        @instructors = Instructor.all
        respond_to do |format|
            format.json { render json: @instructors, include: :reviews }
            format.html
        end
        #render json: @instructors
    end
    
    def show
        @instructor = Instructor.find(params[:id])
        respond_to do |format|
            format.json { render json: @instructor, include: :reviews }
            format.html
        end
    end
    
    def new
        @instructor = Instructor.new
    end
    
    def edit
        @instructor = Instructor.find(params[:id])
    end
    
    def create
        @instructor = Instructor.new(instructor_params) #model initialized with respective attributes
 
        if @instructor.save
            redirect_to @instructor
        else    #restrictions for entry fields were not met
            render 'new' 
        end
    end
    
    def update
      @instructor = Instructor.find(params[:id])

      if @instructor.update(instructor_params)
        redirect_to @instructor
      else
        render 'edit'
      end
    end
    
    def destroy
      @instructor = Instructor.find(params[:id])
      @instructor.destroy

      redirect_to instructors_path
    end
    
    private #made private for mass assignment issues and to make sure it can't be called outside intended context
    def instructor_params  #separate method so it can be used for multiple actions in the same controller
      params.require(:instructor).permit(:name, :format, :description)
    end
end

