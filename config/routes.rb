Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :articles

  scope "/admin" do
    resources :users
  end
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', as: :login
  end
end
