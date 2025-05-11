Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :health_checks, only: %i[index]
      post 'users/login', to: 'users#login'
      post 'users/signup', to: 'users#create'
      post 'users/logout', to: 'users#logout'
      post 'users/reset_password', to: 'users#reset_password'
      post 'users/reset_password_confirm', to: 'users#reset_password_confirm'
      get 'users/refresh_token', to: 'users#refresh_token'
    end
  end
end
