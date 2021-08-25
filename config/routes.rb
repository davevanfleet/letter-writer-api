Rails.application.routes.draw do
  scope '/api' do

    post '/login', to: "sessions#create"
    post '/logout', to: "sessions#destroy"
    get '/get_current_user', to: "sessions#get_current_user"
    get '/get_daily_text', to: "text#todays_text"

    resources :congregations do
      resources :users, only: [:index, :create]
      resources :external_contacts, only: [:index, :create, :destroy]
      resources :territories, only: [:create, :index, :show, :update] do 
        resources :dncs
        resources :assignments
        resources :external_contacts, only: [:index]
      end
      resources :dncs, only: [:index, :create]
      resources :subscriptions
      resources :contacts, only: [:index]
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
