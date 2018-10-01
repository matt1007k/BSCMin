class ForcesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_force, only: [:edit, :update, :show, :destroy]


  def index
    @forces = Force.all
  end


  def show
  end


  def new
    @force = Force.new
  end


  def edit
  end


  def create
    @force = Force.new(force_params)

    respond_to do |format|
      if @force.save
        format.html { redirect_to factors_url, notice: 'La fuerza fue creada con exitó.' }
        format.json { redirect_to @force, status: :created, location: @force }
      else
        format.html { render :new }
        format.json { render json: @force.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @force.update(force_params)
        format.html { redirect_to factors_url, notice: 'La fuerza fue editada con exitó.' }
        format.json { redirect_to @force, status: :ok, location: @force }
      else
        format.html { render :edit }
        format.json { render json: @force.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @force.destroy
    respond_to do |format|
      format.html { redirect_to factors_url, notice: 'La fuerza fue eliminada con exitó.' }
      format.json { head :no_content }
    end
  end

  private
  def force_params
    params.require(:force).permit(:name)
  end

  def find_force
    @force = Force.find(params[:id])
  end
end
