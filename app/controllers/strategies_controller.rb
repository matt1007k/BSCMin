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
        @tipo = params[:tipo]
        
        @strategy = Strategy.new
    end

    
    def edit
    end

    
    def create
        @count = Strategy.count
        @strategy = Strategy.new
        @strategy[:slug] = "E#{@count + 1}"
        @strategy[:foda] = params[:strategy][:foda]
        @strategy[:tipo] = params[:strategy][:tipo]
        @strategy[:content] = params[:strategy][:content]
        
        respond_to do |format|
        if @strategy.save
            @in_objective = InObjective.new
            @in_objective[:objective_id] = params[:strategy][:objective]
            @in_objective[:strategy_id] = @strategy[:id]
            if @in_objective.save 
                format.html { redirect_to strategies_url, notice: 'La estrategía fue creada con exitó.' }
                format.json { redirect_to @strategy, status: :created, location: @strategy }
            else
                format.json { render json: @in_objective.errors, status: :unprocessable_entity }
            end        
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
            params.require(:strategy).permit(:content, :foda)
        end

        def find_strategy
            @strategy = Strategy.find(params[:id])
        end
end
