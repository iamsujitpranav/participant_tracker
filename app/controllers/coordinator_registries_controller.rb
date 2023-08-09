class CoordinatorRegistriesController < ApplicationController
  before_action :set_registry, only: [:edit, :update]

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)
    if @registry.save
      redirect_to coordinator_registries_path, notice: 'Registry and coordinators set up successfully.'
    else
      render :new
    end
  end

  def index
    @registries = Registry.all
  end

  def edit
  end

  def update
    if @registry.update(registry_params)
      redirect_to coordinator_registries_path, notice: 'Registry updated successfully.'
    else
      render :edit
    end
  end

  private

  def registry_params
    params.require(:registry).permit(:name, :location, :state, coordinator_ids: [])
  end

  def set_registry
    @registry = Registry.find(params[:id])
  end
end
