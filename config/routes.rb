Rails.application.routes.draw do

  get 'static_pages/help'=>'static_pages#help',as: 'help'
  get 'static_pages/about'=>'static_pages#about',as: 'about'
 
   root 'static_pages#home'
  get 'sessions/new'=>'sessions#new',as: 'session_new'
  post 'sessions/create'=>'sessions#create',as: 'session_create'
  get 'users/index'=>'users#index',as: 'user_index'
  get 'users/new'=>'users#new',as: 'new_user'
  post 'users/create'=>'users#create',as: 'users_create'
  get 'user/:id/edit'=>'users#edit',as: 'edit_user'
  patch 'user/:id/update'=>'users#update',as: 'users_update'
  delete 'users/:id/destroy'=>'users#destroy',as: 'users_destroy'
  get 'users/:id'=> 'users#show',as: 'user'

  get 'posts/new'=>'posts#new',as: 'post_new'
  post'posts/create'=>'posts#create',as: 'post_create'
  get 'posts/edit'=>'posts#edit',as: 'post_edit'
  get 'posts/index'=>'posts#index',as: 'post_index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
