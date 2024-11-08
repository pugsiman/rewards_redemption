Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show] do
      resources :redemptions, only: %i[index create]
    end

    resources :rewards, only: %w[index]
  end
end
