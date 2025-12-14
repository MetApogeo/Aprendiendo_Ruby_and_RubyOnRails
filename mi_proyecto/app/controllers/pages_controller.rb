class PagesController < ApplicationController
  def hola
    render plain: "Hola Mundo"
  end

  def about
    @message = "Bienvenido al about"
  end
  
end
