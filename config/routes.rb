Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#root'
  get 'signup', to: 'authenticate#signup'
  get 'signin', to: 'authenticate#signin'
  post 'signup_post', to: 'authenticate#signup_post'
  post 'signin_post', to: 'authenticate#signin_post'
  delete 'sign_out' => 'authenticate#sign_out'

  get '/settings', to: 'settings#index'
  get '/settings/account', to: 'settings#index'
  put '/settings/email', to: 'settings#put_email'
  get '/settings/password', to: 'settings#password'
  put '/settings/password', to: 'settings#change_password'
end
