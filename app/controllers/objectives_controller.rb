class ObjectivesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_objective, only: [:edit, :update, :show, :destroy]


    def index
        @perspectives = Perspective.all
    end


    def show
    end


    def new
        @perspective_id = params[:perspective_id]
        @estrategias = Strategy.all
        @objective = Objective.new
    end


    def edit
        @estrategia = []
        @objective = Objective.find(params[:id])
        @my_estrategies = InObjective::where(objective_id: @objective[:id])
    end

    def mapa
        @perspectives = Perspective.all
    end
    

    def create
        @perspective = Perspective.find(params[:objective][:perspective_id])
        @count = Objective.where(perspective_id: params[:objective][:perspective_id]).count
        @objective = Objective.new
        @objective[:slug] = @perspective[:slug]<<"#{@count + 1}" 
        @objective[:content] = params[:objective][:content]
        @objective[:perspective_id] = params[:objective][:perspective_id]

        @estrategias = params[:strategies]  
           
        respond_to do |format|
        if @objective.save

            @estrategias.each do |estrategia|
                @in_objective = InObjective.new
                @in_objective[:objective_id] = @objective[:id]
                @in_objective[:strategy_id] = estrategia[:id]
                if @in_objective.save
                    format.html { redirect_to objectives_url, notice: 'El objetivo fue creada con exitó.' }
                    format.json { redirect_to @objective, status: :created, location: @objective }
                else
                    format.json { render json: @in_objective.errors, status: :unprocessable_entity }
                end
                
            end
            
        else
            format.html { redirect_to objective_new_url(params[:objective][:perspective_id]), alert: 'Error al crear el objetivo.' }
            format.json { render json: @objective.errors, status: :unprocessable_entity }
        end
        end
    end


    def update
        @objective[:content] = params[:objective][:content]
        @estrategias =  params[:objective][:estrategias]  
        respond_to do |format|
        if @objective.save

            @in_objective = InObjective.new
            
            @estrategias.split(",").each do |slug|
                @in_objective[:objective_id] = @objective[:id]
                @estrategia = Strategy.where(slug: slug).first
                @in_objective[:strategy_id] = @estrategia[:id]
                @in_objective.save
            end            

            format.html { redirect_to objectives_url, notice: 'El objetivo fue editada con exitó.' }
            format.json { redirect_to @objective, status: :ok, location: @objective }
        else
            format.html { render :edit, perspective_id: params[:objective][:perspective_id] }
            format.json { render json: @objective.errors, status: :unprocessable_entity }
        end
        end
    end


    def destroy
        @objective.destroy
        respond_to do |format|
        format.html { redirect_to objectives_url, notice: 'El objetivo fue eliminada con exitó.' }
        format.json { head :no_content }
        end
    end

    private
        def objective_params
            params.require(:objective).permit(:content, :perspective_id)
        end

        def find_objective
            @objective = Objective.find(params[:id])
        end
end
