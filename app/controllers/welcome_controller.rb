class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] #query params => variavel esta sendo passada pela url e guardada em um Hash 
  end
end
