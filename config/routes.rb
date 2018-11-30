Blog::Engine.routes.draw do
  resources :articles do
    member do
      get 'export'
    end
    resources :comments
  end
end
