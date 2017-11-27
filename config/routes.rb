Rails.application.routes.draw do
  devise_for :users
    resources :forecasts
    root 'locations#find'
    
    post "/", to: 'locations#submit', as: "submit"
    post 'locations/:id/comments', to: 'comments#create', as: "comment"
    
    
    
    
    #get '/users/sign_in' => 'devise/sessions#new'
    #get '/users/sign_up' => 'devise/registrations#new'
    #get '/users/sign_out' => 'devise/sessions#destroy'
    
    
    get'/about' => 'forecasts#about'
    get '/welcome' => 'forecasts#index'
    get '/forecast' => 'forecasts#show'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
