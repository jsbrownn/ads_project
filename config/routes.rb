Rails.application.routes.draw do

 
  resources :users, only: %i[new create]
  resources :tags do
    get :autocomplete_tag_title, :on => :collection
  end
  resources :ad_posts 
  get 'signup'=> 'users#new'
  get '/tags', to: 'tags#index'
  get '/ad_posts', to: 'ad_post#index' 
 root 'ad_posts#index'


end
