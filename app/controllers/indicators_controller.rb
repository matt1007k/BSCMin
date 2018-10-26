class IndicatorsController < ApplicationController
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]

  # GET /indicators
  # GET /indicators.json
  def index
    
    @objectivos = Objective.all

   # @objectivos = @objectivos.perspectiva(params[:perpective_id]) if params[:perpective_id].present?
    #if params[:perpective].present?
    #  @objectivos = Objective.where("perpective_id = ?", params[:perpective][:id])
    #end
  end

  # GET /indicators/1
  # GET /indicators/1.json
  def show
  end

  # GET /indicators/new
  def new
    @objective_id = params[:objective_id]
    @indicator = Indicator.new
  end

  # GET /indicators/1/edit
  def edit
    @objective_id = params[:objective_id]
  end

  # POST /indicators
  # POST /indicators.json
  def create
    @indicator = Indicator.new(indicator_params)

    respond_to do |format|
      if @indicator.save
        format.html { redirect_to indicators_url, notice: 'El indicador fue creada con exitó.' }
        format.json { render :show, status: :created, location: @indicator }
      else
        format.html { render :new }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicators/1
  # PATCH/PUT /indicators/1.json
  def update
    respond_to do |format|
      if @indicator.update(indicator_params)
        format.html { redirect_to indicators_url, notice: 'El indicador fue editada con exitó.' }
        format.json { render :show, status: :ok, location: @indicator }
      else
        format.html { render :edit }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicators/1
  # DELETE /indicators/1.json
  def destroy
    @indicator.destroy
    respond_to do |format|
      format.html { redirect_to indicators_url, notice: 'El indicador fue eliminada con exitó.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator
      @indicator = Indicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_params
      params.require(:indicator).permit(:objective_id, :aclarar, :variable, :indicador)
    end
end
