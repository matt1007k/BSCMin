class MaestroController < ApplicationController
    def index
        @objectivos = Objective.all

        @ano_anterior = '2016'
        @ano_actual = '2017'
        @semaforo = '2017'

        @ano_anterior = params[:anterior] if params[:anterior].present?
        @ano_actual = params[:actual] if params[:actual].present?
        @semaforo = params[:semaforo] if params[:semaforo].present?
        
    end

    def resumen
        @objectivos = Objective.all
    end
    
end
