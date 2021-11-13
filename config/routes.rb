Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # トップページ
  root to: 'homes#top'
  
  # ユーザー
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  # レシピ
  resources :recipes, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :index, :destroy]
    resources :recipe_comments, only: [:new, :create, :destroy]
  end

  # レビュー
  resources :reviews, only: [:create, :index, :show, :destroy]

  # 商品
  resources :items, only: [:index, :show, :destroy]
  
  # お問い合わせ
  resources :contacts, only: [:new, :create]
  # get 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  # post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  # post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'


end
