Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  
  post '/' => 'posts#create'
  get '/findpost' => 'posts#find_post'
  post '/findpost' => 'posts#find_post'
  post '/allposts' => 'posts#all_posts'
  
end
