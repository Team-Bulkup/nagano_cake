Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :users
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'

  namespace :admin do
    get 'top' => 'homes#top'
    resources :order_products, only: [:update]
    resources :orders, only: [:index, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update] do
      get 'orders' => 'orders#index'
    end
    resources :categories, only: [:index, :create, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
  end

  resources :addresses,only: [:index, :create, :destroy, :edit, :update]
  get 'customer' => 'customers#show'
  get 'customers/withdraw' => 'customers#withdraw'
  put 'customers/hide' => 'customers#hide'
  get 'customers/edit_info' => 'customers#edit_info'
  patch 'customers/update' =>'customers#update'
  put 'customers/update' =>'customers#update'
  resources :orders, only: [:new, :create, :index, :show]
  resources :cart_items, only: [:index, :create, :destroy, :update]
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :products, only: [:index, :show]

end
