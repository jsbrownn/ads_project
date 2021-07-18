Rails.application.routes.draw do
  resources :ad_posts
root 'ad_posts#index'
end
