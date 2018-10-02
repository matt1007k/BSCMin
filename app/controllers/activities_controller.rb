class ActivitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_activity, only: [:edit, :update, :show, :destroy, :edit_actividad]

    
    def index
        @activities = Activity.all
        @areas = Area.order('name ASC')
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

    end

    private 
        def activity_params
            params.require(:activity).permit(:name, :area_id, :media, :baja, :muy_bueno, :bueno, :deficiente, :muy_deficiente, :valor)
        end

        def find_activity
            @activity = Activity.find(params[:id])
        end
        
end
