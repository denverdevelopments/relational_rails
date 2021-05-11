Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## Leigh's Space
  get '/', to: 'welcome#index'
  get '/bakeries', to: 'bakeries#index'

  ## Kevin's Space

end
