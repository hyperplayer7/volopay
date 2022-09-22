Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resource :assignments, only: :index do
    collection do
      post :create_seats
      post :fill_passengers
      get :show_seats
    end
  end
  root "assignments#index"
end
