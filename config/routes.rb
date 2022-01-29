Rails.application.routes.draw do
  resources :politicians
  resources :politician_records
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :states
    end
  end
end
