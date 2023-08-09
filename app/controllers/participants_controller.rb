class ParticipantsController < ApplicationController
	def index
		@participants = Participant.all
	end
    # Other actions...

	def new
		@participant = Participant.new
	end

	def create
		@participant = Participant.new(participant_params)
		if @participant.save
			flash[:success] = "Registry created successfully."
			redirect_to root_path
		else
			flash.now[:error] = "Registry could not be created."
			render :new
		end
	end

	private

  def participant_params
    params.require(:registry).permit(:name, :gender, :date_of_birth)
  end
end
  