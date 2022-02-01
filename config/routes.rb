Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :states
      get '/politicians/search' => 'politicians#search'
      resources :politicians
      get '/politician_records/committee_history' => 'politician_records#committee_history'
      get '/politician_records/administrative_history' => 'politician_records#administrative_history'
      get '/politician_records/legislative_history' => 'politician_records#legislative_history'
      get '/politician_records/political_history' => 'politician_records#political_history'
      get '/politician_records/academic_history' => 'politician_records#academic_history'
      get '/politician_records/private_experience' => 'politician_records#private_experience'
      get '/politician_records/other_experience' => 'politician_records#other_experience'
      resources :politician_records
    end
  end
end
