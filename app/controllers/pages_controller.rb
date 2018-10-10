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

  def fuerzas
    @forces = Force.all
  end

  def factor_interno
    @areas = Area.all
  end

  def factor_externo
    @forces = Force.all
  end

  def matriz_foda
    
  end

  
end
