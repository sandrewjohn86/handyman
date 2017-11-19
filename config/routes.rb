Rails.application.routes.draw do
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

  get 'projects/new'

  get 'projects/create'

  get 'projects/edit'

  get 'projects/update'

  get 'projects/destroy'

  get 'projects/index'

  get 'projects/show'

  devise_for :users, controllers: {
    #confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'user/sessions',
    # unlocks: 'user/unlocks',
  }, skip: [:sessions]

  ## custom routes for users
  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
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
    get 'login' => 'clients/sessions#new', as: :new_client_session
    post 'login' => 'clients/sessions#create', as: :client_session
    delete 'logout' => 'clients/sessions#destroy', as: :destroy_client_session
    get 'register' => 'clients/registrations#new'
  end

  get 'welcome/index'
	
	root to: "welcome#index"

  resources :skills, :projects, :quotes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
