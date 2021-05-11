Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## Leigh's space
  get '/', to: 'welcome#index'

  ## Kevin's space
  get '/shops', to: 'shops#index'
  get '/shops/:id', to: 'shops#show'

  get '/candies', to: 'candies#index'
  get '/candies/:id', to: 'candies#show'
end
