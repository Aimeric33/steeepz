Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :workspaces, only: %i[index show create update destroy] do
    resources :checklists, only: %i[create]
  end

  resources :checklists, only: %i[show edit update destroy] do
    resources :sections, only: %i[create]
  end

  resources :sections, only: %i[update destroy] do
    resources :steps, only: %i[create]
  end

  resources :steps, only: %i[update destroy]

  namespace :share do
    resources :checklists, only: %i[show]
  end
end
