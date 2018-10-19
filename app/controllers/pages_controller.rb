class PagesController < ApplicationController
  def index
    @title = 'Inicio'
  end
  
  def mision_vision    
    @informations = Information.all
  end

  def valores
    @title = 'Los valores'
    @values = Value.order('title ASC') 
  end

  def organigrama    
  end

  def macroproceso    
    @informations = Information.all
    @processings = Processing.all
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
    @fortalezas = Strength.all
    @debilidades = Weakness.all
    @oportunidades = Opportunity.all
    @amenazas = Threat.all

    @estrategia = Strategy.all
  end

  def mapa_estrategico
    
  end

  
end
