Rails.application.routes.draw do

  root 'books#index'

  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/delete'

  resources :books do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
