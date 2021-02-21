Rails.application.routes.draw do
  
  #
  get 'welcome/index'
  
  #get '/inicio', to: 'welcome#index' -> url inicio ira levar direto para o controler welcome

  #resources ira gerar 7 rotas para trabalhar com CRUD.
  resources :coins
   
  #root to -> define a rota padrão ao acessar localhost:3000.
  root to:'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
