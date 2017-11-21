Rails.application.routes.draw do
  get 'directory_lines/new'

  get 'directory_lines/create'

  get 'directory_lines/update'

  get 'directory_lines/edit'

  get 'directory_lines/destroy'

  get 'directory_lines/index'

  get 'directory_lines/show'

  get 'quotes/new'

  get 'quotes/create'

  get 'quotes/update'

  get 'quotes/edit'

  get 'quotes/destroy'

  get 'quotes/index'

  get 'quotes/show'

  get 'users/index'

  get 'users/show'

  get 'directories/new'

  get 'directories/create'

  get 'directories/edit'

  get 'directories/update'

  get 'directories/destroy'

  get 'directories/index'

  get 'directories/show'

  get 'skills/new'

  get 'skills/create'

  get 'skills/edit'

  get 'skills/update'

  get 'skills/destroy'

  get 'skills/index'

  get 'skills/show'

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

  get 'welcome/index'
	
	root to: "welcome#index"

  resources :skills, :projects, :directories

  resources :projects do
    resources :quotes
  end

  resources :directories do
    resources :directory_lines
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
