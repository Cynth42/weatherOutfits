Rails.application.routes.draw do
  devise_for :users
    resources :forecasts
    resources :locations do
       resources :comments
    end
    
    root 'locations#find'
    #root 'forecasts#index'
    
    
    post "/", to: 'locations#submit', as: "submit"
    post 'locations/:id/comments', to: 'comments#create', as: "comment"
    #delete 'locations/:id/comments/:id', to: 'comments#destroy', as: "delete"
    
    
    get '/currentWeather' => 'locations#find'
    
    
    #get '/users/sign_in' => 'devise/sessions#new'
    #get '/users/sign_up' => 'devise/registrations#new'
    #get '/users/sign_out' => 'devise/sessions#destroy'
    
    
    get '/about' => 'forecasts#about'
    get '/welcome' => 'forecasts#index'
    get '/forecast' => 'forecasts#show'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
