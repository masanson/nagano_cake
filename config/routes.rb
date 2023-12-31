Rails.application.routes.draw do

  root to: "public/homes#top"
  get '/about' => 'public/homes#about', as: 'about'

  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
      member do
        get 'withdrawal'
        patch 'update_withdrawal'
      end
    end
    
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all' => 'cart_items#destroy_all'
      end
    end
  
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get 'complition'
        post 'check'
      end
    end
    
  end

  namespace :admin do
    get '' => 'homes#top', as: 'top'
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only:[:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

