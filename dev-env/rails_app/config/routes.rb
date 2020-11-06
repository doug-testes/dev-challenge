Rails.application.routes.draw do
  root "borrower_requests#new"
  resources :borrower_requests, only: [:new, :show, :create] do
    get "review", on: :member
    post "approve", on: :member
    resources :companies
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
