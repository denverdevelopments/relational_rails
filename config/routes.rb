Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  
  ## Leigh's Space
  get '/bakeries', to: 'bakeries#index'
  get '/bakeries/:id', to: 'bakeries#show'

  ## Kevin's space
  get '/shops', to: 'shops#index'
  get '/shops/:id', to: 'shops#show'

  get '/candies', to: 'candies#index'
  get '/candies/:id', to: 'candies#show'
end
