Rails.application.routes.draw do

  resource :end_users, only: [:show, :edit, :update]
  get 'end_users/leave_user'
  patch "end_users/leave" => "end_users#leave"
  root 'items#top'
  resources :items, only: [:index, :show]
  devise_for :end_users, controllers: {   
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions' 
  }
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete "cart_items" => "cart_items#all_destroy", as: 'cart_items_all_destroy'

  get "orders/end"
  resources :orders, only: [:new, :index, :create, :show]
  post "orders/check"
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get "top", :to=>"items#top"
    resources :items
    resources :end_users, only: [:index, :show, :update, :edit]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :update, :show] do
      resources :order_details, only: [:update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
