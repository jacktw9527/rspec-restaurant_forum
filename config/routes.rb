Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:show, :index] do
    resources :comments, only: [:create, :destroy]

    #
    collection do
      get :about
    end

    collection do
      get :feeds
    end

    member do
      get :dashboard
    end

    # 在 restaurant 樣板選擇「喜歡」或「不喜歡」不需要新的樣板，所以不用 GET
    member do
      post :favorite
      post :unfavorite
    end

    member do
      post :like
      post :unlike
    end

    collection do
      get :ranking
    end
  end

  resources :followships, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :friend_list
    end
  end



  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
