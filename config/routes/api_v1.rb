Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :health_checks, only: %i[index]
    end
  end
end
