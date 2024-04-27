Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  resources :users, only: %i[index show]
  resources :books do
    resources :comments, only: %i[create destroy], module: :books
  end
  resources :reports do
    resources :comments, only: %i[create destroy], module: :reports
  end
  root to: 'books#index'
end
