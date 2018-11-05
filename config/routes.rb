Rails.application.routes.draw do
  get '/', to: 'login#home' #Home (depends on logged in or not)
  get '/login/new', to: 'login#new' #New User
  post '/login/new', to: 'login#confirm'
  get '/login/check', to: 'login#login' #Login
  post '/login/check', to: 'login#check'
  get '/login/success', to: 'login#success'
  get '/login/failed', to: 'login#failed'
  get '/login/logout', to: 'login#logout' #Logout
  post '/login/logout', to: 'login#logout'
  get 'login/blank', to: 'login#blank'
  get 'login/email', to: 'login#email'
end
