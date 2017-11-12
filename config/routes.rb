Rails.application.routes.draw do
  resources :locations
	get 'index' => 'welcome#index'	
  get 'weather' => 'welcome#weather'
  get 'blog' => 'welcome#blog'
  get 'store' => 'welcome#store'
  get 'map' => 'welcome#map'
  get 'busmap' => 'locations#new'
  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
