Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :users, :only => [:new, :create, :index, :show] do
    resources :runs, :only => [:index, :show]
  end

  resources :runs, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]
end
