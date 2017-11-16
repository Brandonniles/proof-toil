Rails.application.routes.draw do
  get 'cart/add_to_cart'

  get 'cart/view_order'

  get 'cart/checkout'

  resources :products
  resources :locations
  get 'allproducts' => 'storefront#all_items'
  get 'categorical' => 'storefront#items_by_category'
  get 'families' => 'storefront#items_by_family'
	get 'index' => 'welcome#index'	
  get 'weather' => 'welcome#weather'
  get 'blog' => 'welcome#blog'
  get 'store' => 'welcome#store'
  get 'map' => 'welcome#map'
  get 'busmap' => 'locations#new'
  get 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'

  post 'order_complete' => 'cart#order_complete'
  post 'add_to_cart' => 'cart#add_to_cart'
  post 'weather' => 'welcome#weather'

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
