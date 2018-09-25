class AreasController < ApplicationController
    before_action :authenticate_user!
    before_action :find_area, only: [:edit, :update, :show, :destroy]

    
    def index
        @areas = Area.all
    end

    
    def show
    end

    
    def new
        @area = Area.new
    end

    
    def edit
    end

    
    def create
        @area = Area.new(area_params)

        respond_to do |format|
        if @area.save
            format.html { redirect_to activities_url, notice: 'El área fue creada con exitó.' }
            format.json { redirect_to @area, status: :created, location: @area }
        else
            format.html { render :new }
            format.json { render json: @area.errors, status: :unprocessable_entity }
        end
        end
    end

    
    def update
        respond_to do |format|
        if @area.update(area_params)
            format.html { redirect_to activities_url, notice: 'El área fue editada con exitó.' }
            format.json { redirect_to @area, status: :ok, location: @area }
        else
            format.html { render :edit }
            format.json { render json: @area.errors, status: :unprocessable_entity }
        end
        end
    end

    
    def destroy
        @area.destroy
        respond_to do |format|
            format.html { redirect_to activities_url, notice: 'El área fue eliminada con exitó.' }
            format.json { head :no_content }
        end
    end

    private 
        def area_params
            params.require(:area).permit(:name)
        end

        def find_area
            @area = Area.find(params[:id])
        end
        
end
