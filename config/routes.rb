Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :workspaces, only: %i[index show create update destroy]
  resources :checklists, only: %i[show create edit update destroy]
  resources :sections, only: %i[create update destroy] do
    resources :steps, only: %i[create]
  end
  resources :steps, only: %i[update destroy]
end
