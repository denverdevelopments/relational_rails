Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  ## Leigh's Space
  get '/bakeries', to: 'bakeries#index'
  get '/bakeries/new', to: 'bakeries#new'
  post '/bakeries/', to: 'bakeries#create'
  get '/bakeries/:id', to: 'bakeries#show'

  get '/bakeries/:id/pastries/new', to: 'pastries#new'
  post '/bakeries/:id/pastries/', to: 'pastries#create'
  get '/bakeries/:id/pastries', to: 'bakeries#pastries'

  get '/bakeries/:id/edit', to: 'bakeries#edit'
  patch '/bakeries/:id', to: 'bakeries#update'

  get '/pastries', to: 'pastries#index'
  get '/pastries/:id', to: 'pastries#show'
  get '/pastries/:id/edit', to: 'pastries#edit'
  patch '/pastries/:id', to: 'pastries#update'

  ## Kevin's Sweet space
  get '/shops', to: 'shops#index'
  get '/shops/new', to: 'shops#new'
  post '/shops/', to: 'shops#create'
  get '/shops/:id', to: 'shops#show'
  get '/shops/:id/candies/new', to: 'candies#new'
  post '/shops/:id/candies/', to: 'candies#create'
  get '/shops/:id/candies', to: 'shops#candies'

  get '/shops/:id/edit', to: 'shops#edit'
  patch '/shops/:id', to: 'shops#update'
  delete '/shops/:id', to: 'shops#destroy'

  get '/candies', to: 'candies#index'
  get '/candies/new', to: 'candies#new'
  post '/candies/', to: 'candies#create'
  get '/candies/:id', to: 'candies#show'
  get '/candies/:id/edit', to: 'candies#edit'
  patch '/candies/:id', to: 'candies#update'
  delete '/candies/:id', to: 'candies#destroy'
end
