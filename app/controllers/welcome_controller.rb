class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby On Rails"
    session[:curso] = "Curso de Ruby On Rails Session"
    @nome = params[:nome] #query params => variavel esta sendo passada pela url e guardada em um Hash 
  end
end
