class EvaluationsController < ApplicationController
  def evaluar_factor_interno
    @areas = Area.all
  end

  def edit_factor_interno
    @activity = Activity.find(params[:id])
  end

  def evaluar_factor_externo
    @forces = Force.all
  end

  def edit_factor_externo
    @factor = Factor.find(params[:id])
  end

 
    
end
