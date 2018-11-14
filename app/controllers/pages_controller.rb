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
    @perspectives = Perspective.all
  end

  def indicador_datos
    @objectivos = Objective.all
    @indicators = Indicator.all
  end
  
  def indicador_maestro
      @objectivos = Objective.all

      @ano_anterior = '2016'
      @ano_actual = '2017'
      @semaforo = '2017'

      @ano_anterior = params[:anterior] if params[:anterior].present?
      @ano_actual = params[:actual] if params[:actual].present?
      @semaforo = params[:semaforo] if params[:semaforo].present?
  end

  def indicador_resumen
      @objectivos = Objective.all
  end
  
  
end
