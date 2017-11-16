Rails.application.routes.draw do
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

  post 'weather' => 'welcome#weather'

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
