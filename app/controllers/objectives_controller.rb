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
        @perspective_id = params[:perspective_id]
        @estrategias = Strategy.all
    end

    def mapa
        @perspectives = Perspective.all
    end
    

    def create
        @perspective = Perspective.find(params[:objective][:perspective_id])
        @count = Objective.count
        @objective = Objective.new
        @objective[:slug] = @perspective[:slug]<<"#{@count + 1}" 
        @objective[:content] = params[:objective][:content]
        @objective[:perspective_id] = params[:objective][:perspective_id]
        respond_to do |format|
        if @objective.save
            format.html { redirect_to objectives_url, notice: 'El objetivo fue creada con exitó.' }
            format.json { redirect_to @objective, status: :created, location: @objective }
        else
            format.html { redirect_to objective_new_url(params[:objective][:perspective_id]), alert: 'Error al crear el objetivo.' }
            format.json { render json: @objective.errors, status: :unprocessable_entity }
        end
        end
    end


    def update
        respond_to do |format|
        if @objective.update(objective_params)
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
