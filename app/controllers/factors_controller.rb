class FactorsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_factor, only: [:edit, :update, :show, :destroy, :edit_factor]


  def index
    @factors = Factor.all
    @forces = Force.order('name ASC')
  end


  def show
  end


  def new
    @force_id = params[:force_id]
    @factor = Factor.new
  end

  def new_factor
    @force_id = params[:force_id]
    @factor = Factor.new
  end

  def edit_factor
    @force_id = params[:force_id]
  end

  def edit
  end


  def create
    @factor = Factor.new(factor_params)

    respond_to do |format|
      if @factor.save
        format.html { redirect_to factors_url, notice: 'El factor fue creado con exitó.' }
        format.json { redirect_to @factor, status: :created, location: @factor }
      else
        format.html { render :new_factor }
        format.json { render json: @factor.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @factor.update(factor_params)
        format.html { redirect_to factors_url, notice: 'El factor fue editado con exitó.' }
        format.json { redirect_to @factor, status: :ok, location: @factor }
      else
        format.html { render :edit }
        format.json { render json: @factor.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @factor.destroy
    respond_to do |format|
      format.html { redirect_to factors_url, notice: 'El factor fue eliminado con exitó.' }
      format.json { head :no_content }
    end
  end

  def update_factor_externo

  end

  private
  def factor_params
    params.require(:factor).permit(:title, :force_id, :alta, :media, :baja, :muy_positivo, :positivo, :negativo, :muy_negativo, :valor)
  end

  def find_factor
    @factor = Factor.find(params[:id])
  end
end
