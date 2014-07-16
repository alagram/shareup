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
end
