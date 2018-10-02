class EvaluationsController < ApplicationController
  def evaluar_factor_interno
    @areas = Area.all
  end

  def evaluar_factor_externo
    @forces = Force.all
  end
end
