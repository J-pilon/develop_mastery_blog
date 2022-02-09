Rails.application.routes.draw do
    resources :articles

    root 'homepage#index'

    get '*path', to: 'static#page_not_found'
end
