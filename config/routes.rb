Blog::Engine.routes.draw do
  resources :articles do
    get 'export', to: 'articles#export'
  end
end
