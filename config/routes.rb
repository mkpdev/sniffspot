Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'spots/index'
  # get 'spots/show'
  # get 'spots/new'
  # get 'spots/create'
  # get 'spots/edit'
  # get 'spots/update'
  # get 'spots/destroy'

  root "spots#index"
  get '/spots/:id/reviews' , to:"reviews#list_reviews"
  resources :spots do
    resources :reviews, except: :index
  end
end
