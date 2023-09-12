Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :workspaces, only: %i[index show create update destroy]
  resources :checklists, only: %i[show create edit update destroy] do
    resources :sections, only: %i[create]
  end
  resources :sections, only: %i[update destroy] do
    resources :steps, only: %i[create]
  end
  resources :steps, only: %i[update destroy]
end
