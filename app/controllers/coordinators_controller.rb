class CoordinatorsController < ApplicationController
  before_action :set_coordinator, only: [:edit, :update]

  def new
    @coordinator = Coordinator.new
  end

  def create
    @coordinator = Coordinator.new(coordinator_params)
    if @coordinator.save
      redirect_to coordinators_path, notice: 'Coordinator created successfully.'
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @coordinator.update(coordinator_params)
      redirect_to coordinators_path, notice: 'Coordinator updated successfully.'
    else
      render :edit
    end
  end

  def index
    @coordinators = Coordinator.all
  end

  private

  def set_coordinator
    @coordinator = Coordinator.find(params[:id])
  end

  def coordinator_params
    params.require(:coordinator).permit(:name, :email, :phone_number)
  end
end
