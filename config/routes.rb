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
    resources :customers, only: [:show, :edit, :update]
    get 'customers/withdrawal' => 'customers#withdrawal'
    patch 'customers/withdrawal' => 'customers#update_wd'
  end

  namespace :admin do
    get '' => 'homes#top', as: 'top'
    resources :genres, only: [:create, :index, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

