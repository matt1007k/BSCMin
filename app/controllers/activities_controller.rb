class ActivitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_activity, only: [:edit, :update, :show, :destroy, :edit_actividad, :update_factor_interno]

    
    def index
        @activities = Activity.all
        @areas = Area.all
    end

    
    def show
    end

    
    def new
        @area_id = params[:area_id]
        @activity = Activity.new
    end

    def new_actividad
        @area_id = params[:area_id]
        @activity = Activity.new
    end

    def edit_actividad
        @area_id = params[:area_id]
    end
    
    def edit
    end

    
    def create
        @activity = Activity.new(activity_params)

        respond_to do |format|
        if @activity.save
            format.html { redirect_to activities_url, notice: 'El área fue creada con exitó.' }
            format.json { redirect_to @activity, status: :created, location: @activity }
        else
            format.html { render :new }
            format.json { render json: @activity.errors, status: :unprocessable_entity }
        end
        end
    end

    
    def update
        respond_to do |format|
        if @activity.update(activity_params)
            format.html { redirect_to activities_url, notice: 'El área fue editada con exitó.' }
            format.json { redirect_to @activity, status: :ok, location: @activity }
        else
            format.html { render :edit }
            format.json { render json: @activity.errors, status: :unprocessable_entity }
        end
        end
    end

    
    def destroy
        @activity.destroy
        respond_to do |format|
        format.html { redirect_to activities_url, notice: 'El área fue eliminada con exitó.' }
        format.json { head :no_content }
        end
    end

    def update_factor_interno
        @activity[:alta] = params[:activity][:alta]
        @activity[:media] = params[:activity][:media]
        @activity[:baja] = params[:activity][:baja]
        @activity[:muy_bueno] = params[:activity][:muy_bueno]
        @activity[:bueno] = params[:activity][:bueno]
        @activity[:deficiente] = params[:activity][:deficiente]
        @activity[:muy_deficiente] = params[:activity][:muy_deficiente]
        @valor ||= (@activity[:alta] + @activity[:media] + @activity[:baja]) * (@activity[:muy_bueno] + @activity[:bueno] + @activity[:deficiente] + @activity[:muy_deficiente])
        @activity[:valor] = @valor

        respond_to do |format|
            if @activity.save
                if @activity[:valor] > 0
                    @total = Strength.count
                    @fortaleza = Strength.new
                    @fortaleza[:slug] = "F#{@total + 1}"
                    @fortaleza[:content] = @activity[:name]
                    @fortaleza.save

                    format.html { redirect_to evaluar_factor_interno_url, notice: 'La evaluación se hizo con exitó.' }
                    format.json { redirect_to @activity, status: :ok, location: @activity }
                else
                    @total = Weakness.count
                    @debilidad = Weakness.new
                    @debilidad[:slug] = "D#{@total + 1}"
                    @debilidad[:content] = @activity[:name]
                    @debilidad.save

                    format.html { redirect_to evaluar_factor_interno_url, notice: 'La evaluación se hizo con exitó.' }
                    format.json { redirect_to @activity, status: :ok, location: @activity }
                end                
            else
                format.html { render :edit }
                format.json { render json: @activity.errors, status: :unprocessable_entity }
            end
        end
        #render json: params[:activity][:alta]
        #@valor ||= (@activity[:alta] + @activity[:media] + @activity[:baja]) * (@activity[:muy_bueno] + @activity[:bueno] + @activity[:deficiente] + @activity[:muy_deficiente])
        #render json: activity_params
        
    end

    private 
        def activity_params
            params.require(:activity).permit(:name, :area_id, :alta, :media, :baja, :muy_bueno, :bueno, :deficiente, :muy_deficiente, :valor)
        end

        def find_activity
            @activity = Activity.find(params[:id])
        end
        
end
