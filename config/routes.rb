Blog::Engine.routes.draw do
  resources :articles do
    member do
      get 'export'
    end
  end
end
