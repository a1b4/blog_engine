Blog::Engine.routes.draw do
  resources :articles do
    member do
      get 'export'
    end
    resources :comments, except: %i[show update]
  end
end
