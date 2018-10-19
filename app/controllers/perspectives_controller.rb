class PerspectivesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_perspective, only: [:edit, :update, :show, :destroy]


    def index
        @perspectives = Perspective.all
    end


    def show
    end


    def new
        @perspective = Perspective.new
    end


    def edit
    end


    def create
        @perspective = Perspective.new
        @perspective[:slug] = params[:perspective][:title][0]
        @perspective[:title] = params[:perspective][:title]

        respond_to do |format|
        if @perspective.save
            format.html { redirect_to objectives_url, notice: 'La perspectiva fue creada con exitó.' }
            format.json { redirect_to @perspective, status: :created, location: @perspective }
        else
            format.html { render :new }
            format.json { render json: @perspective.errors, status: :unprocessable_entity }
        end
        end
    end


    def update
        @perspective[:slug] = params[:perspective][:title][0]
        @perspective[:title] = params[:perspective][:title]
        respond_to do |format|
        if @perspective.save
            format.html { redirect_to objectives_url, notice: 'La perspectiva fue editada con exitó.' }
            format.json { redirect_to @perspective, status: :ok, location: @perspective }
        else
            format.html { render :edit }
            format.json { render json: @perspective.errors, status: :unprocessable_entity }
        end
        end
    end


    def destroy
        @perspective.destroy
        respond_to do |format|
        format.html { redirect_to objectives_url, notice: 'La perspectiva fue eliminada con exitó.' }
        format.json { head :no_content }
        end
    end

    private
    def perspective_params
        params.require(:perspective).permit(:title)
    end

    def find_perspective
        @perspective = Perspective.find(params[:id])
    end
end
