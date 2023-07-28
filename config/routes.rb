Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :workspaces, only: %i[index show create update destroy]
  resources :checklists, only: %i[show create edit update destroy]
  # resource :sections, only: %i[create update destroy]
  # resource :steps, only: %i[create edit update destroy]
end
