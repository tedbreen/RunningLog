Rails.application.routes.draw do
  resources :users, :only => [:new, :create, :index, :show]
  resource :session, :only => [:new, :create, :destroy]
end
