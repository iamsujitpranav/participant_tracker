class RegistriesController < ApplicationController

	before_action :set_registry, only: [:edit, :update]


	def index
		@registries = Registry.all
	end

	def new
		@registry = Registry.new
	end

	def edit
		
	end

	def update
		if @registry.update(registry_params)
      redirect_to registries_path, notice: 'Registry updated successfully.'
    else
      render :edit
    end
	end

	def create
		@registry = Registry.new(registry_params)
		if @registry.save
			flash[:success] = "Registry created successfully."
			redirect_to root_path
		else
			flash.now[:error] = "Registry could not be created."
			render :new
		end
	end

	def show_by_registry
		registry_id = params[:registry_id]
    @participants_by_coordinator = Enrollment.includes(:participant, :coordinator).where(registry_id: registry_id).group_by(&:coordinator)
	end

	private

	def set_registry
		@registry = Registry.find(params[:id])
	end

  def registry_params
    params.require(:registry).permit(:name, :location, :state)
  end
end
  