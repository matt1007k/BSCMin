class FactorsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_factor, only: [:edit, :update, :show, :destroy, :edit_factor, :update_factor_externo]


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
    @factor[:alta] = params[:factor][:alta]
    @factor[:media] = params[:factor][:media]
    @factor[:baja] = params[:factor][:baja]
    @factor[:muy_positivo] = params[:factor][:muy_positivo]
    @factor[:positivo] = params[:factor][:positivo]
    @factor[:negativo] = params[:factor][:negativo]
    @factor[:muy_negativo] = params[:factor][:muy_negativo]
    @valor ||= (@factor[:alta] + @factor[:media] + @factor[:baja]) * (@factor[:muy_positivo] + @factor[:positivo] + @factor[:negativo] + @factor[:muy_negativo])
    @factor[:valor] = @valor

    respond_to do |format|
        if @factor.save
            format.html { redirect_to evaluar_factor_externo_url, notice: 'La evaluación se hizo con exitó.' }
            format.json { redirect_to @factor, status: :ok, location: @factor }
        else
            format.html { render :edit }
            format.json { render json: @factor.errors, status: :unprocessable_entity }
        end
    end
  end

  private
  def factor_params
    params.require(:factor).permit(:title, :force_id, :alta, :media, :baja, :muy_positivo, :positivo, :negativo, :muy_negativo, :valor)
  end

  def find_factor
    @factor = Factor.find(params[:id])
  end
end
