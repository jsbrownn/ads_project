Rails.application.routes.draw do
  resources :tags
  resources :ad_posts
  get '/tags', to: 'tags#index'
  get '/ad_posts', to: 'ad_post#index'
root 'main_page#index'
end
