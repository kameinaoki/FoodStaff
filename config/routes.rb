Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # トップページ
  root to: 'homes#top'

  # ユーザー
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :favorites
    end
  end

  # レシピ
  resources :recipes, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :index, :destroy]
    resources :recipe_comments, only: [:new, :create, :destroy]
    # 検索機能用
    collection do
      get 'search'
    end
  end

  # レビュー
  resources :reviews, only: [:new, :create, :index, :show, :destroy]

  # 商品
  resources :items, only: [:index, :show, :destroy]

  # お問い合わせ
  resources :contacts, only: [:new, :create]
  get 'done', to: 'contacts#done', as: 'done'


end
