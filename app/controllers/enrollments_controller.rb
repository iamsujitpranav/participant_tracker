class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      flash[:success] = "Participant enrolled successfully."
      redirect_to root_path
    else
      flash.now[:error] = "Enrollment could not be saved. #{@enrollment.errors.messages}"
      render :new
    end
  end

  def index
    @enrollments = Enrollment.all
  end
  
  private

  def enrollment_params
    params.require(:enrollment).permit(:participant_id, :coordinator_id, :registry_id, :date_of_enrollment, :method_of_contact, :remarks)
  end
end
