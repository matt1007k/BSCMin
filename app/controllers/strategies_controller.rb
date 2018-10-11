class StrategiesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_strategy, only: [:edit, :update, :show, :destroy]

    
    def index        
        @fortalezas = Strength.all
        @debilidades = Weakness.all
        @oportunidades = Opportunity.all
        @amenazas = Threat.all

        @estrategia = Strategy.all
        @strategy = Strategy.new
    end

    
    def show
    end

    
    def new
        @strategy = Strategy.new
    end

    
    def edit
    end

    
    def create
        @strategy = Strategy.new(strategy_params)

        respond_to do |format|
        if @strategy.save
            format.html { redirect_to strategies_url, notice: 'La estrategía fue creada con exitó.' }
            format.json { redirect_to @strategy, status: :created, location: @strategy }
        else
            format.html { render :new }
            format.json { render json: @strategy.errors, status: :unprocessable_entity }
        end
        end
    end

    
    def update
        respond_to do |format|
        if @strategy.update(strategy_params)
            format.html { redirect_to strategies_url, notice: 'La estrategía fue editada con exitó.' }
            format.json { redirect_to @strategy, status: :ok, location: @strategy }
        else
            format.html { render :edit }
            format.json { render json: @strategy.errors, status: :unprocessable_entity }
        end
        end
    end

    
    def destroy
        @strategy.destroy
        respond_to do |format|
            format.html { redirect_to strategies_url, notice: 'La estrategía fue eliminada con exitó.' }
            format.json { head :no_content }
        end
    end

    private 
        def strategy_params
            params.require(:strategy).permit(:content, :type, :foda)
        end

        def find_strategy
            @strategy = Strategy.find(params[:id])
        end
end
