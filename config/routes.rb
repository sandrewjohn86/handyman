Rails.application.routes.draw do

  devise_for :admins
  namespace :users do
    get 'dashboard/index'
  end

  namespace :clients do
    get 'dashboard/index'
  end

  # get 'index/show'

  # get 'index/edit'

  # get 'index/update'

  # get 'index/destroy'

  # get 'index/create'

  # get 'index/new'

  # get 'quotes/new'

  # get 'quotes/create'

  # get 'quotes/update'

  # get 'quotes/edit'

  # get 'quotes/destroy'

  # get 'quotes/index'

  # get 'quotes/show'

  # get 'users/index'

  # get 'users/show'

  # get 'directories/new'

  # get 'directories/create'

  # get 'directories/edit'

  # get 'directories/update'

  # get 'directories/destroy'

  # get 'directories/index'

  # get 'directories/show'

  # get 'skills/new'

  # get 'skills/create'

  # get 'skills/edit'

  # get 'skills/update'

  # get 'skills/destroy'

  # get 'skills/index'

  # get 'skills/show'

  devise_for :users, controllers: {
    #confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'user/sessions',
    # unlocks: 'user/unlocks',
  }, skip: [:sessions]

  ## custom routes for users
  as :user do
    get 'users/login' => 'users/sessions#new', as: :new_user_session
    post 'users/login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end

  resources :users, only: [:index, :show] 

  namespace :users do
    resources :projects do
      resources :quotes, :only => [:new, :create, :index, :show, :destroy, :edit, :update]
    end
  end
  
  namespace :users do
    resources :directories do
      resources :directory_lines, :only => [:new, :create]
    end
  end

  # resources :users do
  #   resources :directories do
  #     resources :directory_lines, :only => [:new, :create]
  #   end
  # end

  devise_for :clients, controllers: {
    #confirmations: 'clients/confirmations',
    passwords: 'clients/passwords',
    registrations: 'clients/registrations',
    sessions: 'client/sessions',
    # unlocks: 'client/unlocks',
  }, skip: [:sessions]

  ## custom routes for clients
  as :client do
    get 'clients/login' => 'clients/sessions#new', as: :new_client_session
    post 'clients/login' => 'clients/sessions#create', as: :client_session
    delete 'logout' => 'clients/sessions#destroy', as: :destroy_client_session
    get 'register' => 'clients/registrations#new'
  end

  # resources :clients

  # resources :clients do
  #    resources :projects, :only => [:new, :create, :index, :edit, :update, :destroy]
  # end

  namespace :clients do
    resources :projects do
      resources :quotes, :only => [:index, :show, :destroy]
    end
  end

  # namespace :clients do
  #   resources :directories
  # end

  namespace :clients do
    resources :directories do
      resources :directory_lines, :only => [:index, :create, :destroy, :update]
    end
  end

  # resources :clients, :only => [:index]

  namespace :clients do
    resources :dashboard, :only => [:index]
  end

  get 'welcome/index'
	
  authenticated :client do
    root :to => "clients/dashboard#index"
  end

  authenticated :user do
    root :to => "users/dashboard#index"
  end

	root to: "welcome#index"

  resources :skills

  resources :projects, :only => [:index, :show]

  # resources :projects do
  #   resources :quotes
  # end

  # resources :directories do
  #   resources :directory_lines, :only => [:index]
  # end

  # resources :directory_lines, :only => [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
