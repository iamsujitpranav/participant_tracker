Rails.application.routes.draw do
  # get 'coordinator_registries/new'
  # get 'coordinator_registries/create'
  # get 'coordinator_registries/index'
  # get 'coordinator_registries/edit'
  # get 'coordinator_registries/update'
  # Participants
  resources :participants, except: [:edit, :update, :destroy]

  # Coordinators
  resources :coordinator_registries, only: [:new, :create, :index, :edit, :update]
  resources :coordinators, except: [:destroy]


  # Registries
  resources :registries, except: [:destroy] do
    get :show_by_registry
  end

  # Enrollments
  resources :enrollments 

  root 'enrollments#index'
end
