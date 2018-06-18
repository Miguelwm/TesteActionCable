Rails.application.routes.draw do
  require 'sidekiq/web'


  root 'hello#index'
  mount Sidekiq::Web => '/sidekiq'
  post '/upload', to: 'hello#upload_file'
  post '/zip/:id', to: 'hello#zip', as:"zip"
  get '/update/:id', to: 'hello#update', as:"update"
  get '/update/pending/:id', to: 'hello#pending', as:"pending"
  get '/teste', to: 'hello#teste', as:"teste"
  post '/btnteste', to: 'hello#btnteste', as:"btnteste"

  mount ActionCable.server, at: '/cable'
end
