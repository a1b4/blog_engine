Blog::Engine.routes.draw do
  resources :articles do
    member do
      get 'export'
    end
    resources :comments, except: %i[show update] do
      member do
        post 'reply'
      end
    end
  end
end
