Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#root'
  get 'signup', to: 'authenticate#signup'
  get 'signin', to: 'authenticate#signin'
  post 'signup_post', to: 'authenticate#signup_post'
  post 'signin_post', to: 'authenticate#signin_post'
end
