class PagesController < ApplicationController
  def index
    @title = 'Inicio'
  end
  
  def mision_vision    
    @missions = Mission.all
    @visions = Vision.all
  end

  def valores
    @title = 'Los valores'
    @values = Value.order('title ASC') 
  end

  def organigrama    
  end

  def macroproceso    
  end

  def cadena
    @areas = Area.all
  end

  
end
