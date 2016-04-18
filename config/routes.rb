Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  # users
  get 'signup'  => 'users#new'
  # users sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
