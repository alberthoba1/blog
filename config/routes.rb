Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create, :destroy]
    get :test_2, on: :member
  end

  resources :contacts, only: [:create, :index, :new, :destroy]


  root 'pages#home'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
