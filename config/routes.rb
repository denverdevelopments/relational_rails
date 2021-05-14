Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  ## Leigh's Space
  get '/bakeries', to: 'bakeries#index'
  get '/bakeries/:id', to: 'bakeries#show'

  get '/pastries', to: 'pastries#index'
  get '/pastries/:id', to: 'pastries#show'

  ## Kevin's Sweet space
  get '/shops', to: 'shops#index'
  get '/shops/new', to: 'shops#new'
  post '/shops/', to: 'shops#create'
  get '/shops/:id', to: 'shops#show'
  get '/shops/:shop_id/candies', to: 'shops#candies'

  # get '/shops/:id/new', to: 'shops#new'
  # post '/shops/:id', to: 'shops#create'
  get '/shops/:id/edit', to: 'shops#edit'
  patch '/shops/:id', to: 'shops#update'
  delete '/shops/:id', to: 'shops#destroy'

  get '/candies', to: 'candies#index'
  get '/candies/:id', to: 'candies#show'
end
