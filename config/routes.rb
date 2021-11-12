Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  
  resources :recipes, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :index, :destroy]
    resources :recipe_comments, only: [:new, :create, :destroy]
  end
    
  resources :reviews, only: [:create, :index, :show, :destroy]
  
  resources :items, only: [:index, :show, :destroy]
  

end
