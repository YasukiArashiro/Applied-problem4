Rails.application.routes.draw do
  get 'users/show'
  get 'homes/top'
  get 'home/about' => "homes#about"

  root to: "homes#top"

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }


  delete '/books/:book_id/favorites', to: 'favorites#destroy' ,as: :favorite_delete

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destory]
    resource :book_comments, only: [:create, :destroy]
  end
end
