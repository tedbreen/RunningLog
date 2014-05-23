Rails.application.routes.draw do
  root :to => 'static_pages#root'

  namespace :api do
    resources :runs, :only => [:new, :create, :index, :show]
  end

  resources :users, :only => [:new, :create, :index, :show]
  resource :session, :only => [:new, :create, :destroy]
end
