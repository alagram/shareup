Shareup::Application.routes.draw do
  root to: 'welcome#index'

  namespace :api do
    resources :shares
  end

  devise_for :users,
          :controllers => {
            :omniauth_callbacks => "users/omniauth_callbacks"
          }

  get '/dashboard', to: 'welcome#dashboard'

  devise_scope :user do
    get '/api/current_user' => 'users/sessions#show_currrent_user', as: 'show_currrent_user'
    post '/api/check/is_user' => 'users/users#is_user', as: 'is_user'
  end
end
