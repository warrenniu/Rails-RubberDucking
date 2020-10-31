Rails.application.routes.draw do
  resources :ducks, only: [:index, :show, :new, :create, :update, :edit]
  resources :students, only: [:index, :show, :new, :create, :update, :edit]
end
