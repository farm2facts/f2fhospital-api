Rails.application.routes.draw do
  resources :hospital_communities
  resources :hospital_vendors
  resources :hospital_managements
  #get 'refresh/create'
  #get 'signin/create'
  #get 'signin/destroy'
  #get 'signup/create'

  #resources :hospital_summaries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    #namespace :v1 do
      resources :hospital_summaries
      resources :hospital_managements
      resource :hospital_vendors
      resource :hospital_communities
    #end
  end

  # defines the request, controller, name of the URL path, and action to fire
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  post 'signout', controller: :signin, action: :signout

  #post 'create_summary', controller: :hospital_summaries, action: :create
end
