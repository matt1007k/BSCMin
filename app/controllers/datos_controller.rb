class DatosController < ApplicationController
  before_action :set_dato, only: [:show, :edit, :update, :destroy]

  # GET /datos
  # GET /datos.json
  def index
    @objectivos = Objective.all
    @indicators = Indicator.all
  end

  # GET /datos/1
  # GET /datos/1.json
  def show
  end

  # GET /datos/new
  def new
    @indicator_id = params[:indicator_id]
    @dato = Dato.new
  end

  # GET /datos/1/edit
  def edit
    @indicator_id = params[:indicator_id]
  end

  # POST /datos
  # POST /datos.json
  def create
    @dato = Dato.new
    @dato[:indicator_id] = params[:dato][:indicator_id]

    @dato[:anio] = params[:dato][:anio]
    @dato[:enero] = params[:dato][:enero]
    @dato[:febrero] = params[:dato][:febrero]
    @dato[:marzo] = params[:dato][:marzo]
    @dato[:abril] = params[:dato][:abril]
    @dato[:mayo] = params[:dato][:mayo]
    @dato[:junio] = params[:dato][:junio]
    @dato[:julio] = params[:dato][:julio]
    @dato[:agosto] = params[:dato][:agosto]
    @dato[:septiembre] = params[:dato][:septiembre]
    @dato[:octubre] = params[:dato][:octubre]
    @dato[:noviembre] = params[:dato][:noviembre]
    @dato[:diciembre] = params[:dato][:diciembre]

    @total ||= (@dato[:enero] + @dato[:febrero] + @dato[:marzo] + @dato[:abril] + @dato[:mayo]+ @dato[:junio] + @dato[:julio] + @dato[:agosto] + @dato[:septiembre] + @dato[:octubre] + @dato[:noviembre]  + @dato[:diciembre])
    @dato[:total] = @total


    respond_to do |format|
      if @dato.save
        format.html { redirect_to datos_url, notice: 'Los datos se fue crearon con exitó.' }
        format.json { render :show, status: :created, location: @dato }
      else
        format.html { render :new }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datos/1
  # PATCH/PUT /datos/1.json
  def update
    @dato[:indicator_id] = params[:dato][:indicator_id]

    @dato[:anio] = params[:dato][:anio]
    @dato[:enero] = params[:dato][:enero]
    @dato[:febrero] = params[:dato][:febrero]
    @dato[:marzo] = params[:dato][:marzo]
    @dato[:abril] = params[:dato][:abril]
    @dato[:mayo] = params[:dato][:mayo]
    @dato[:junio] = params[:dato][:junio]
    @dato[:julio] = params[:dato][:julio]
    @dato[:agosto] = params[:dato][:agosto]
    @dato[:septiembre] = params[:dato][:septiembre]
    @dato[:octubre] = params[:dato][:octubre]
    @dato[:noviembre] = params[:dato][:noviembre]
    @dato[:diciembre] = params[:dato][:diciembre]

    @total ||= (@dato[:enero] + @dato[:febrero] + @dato[:marzo] + @dato[:abril] + @dato[:mayo]+ @dato[:junio] + @dato[:julio] + @dato[:agosto] + @dato[:septiembre] + @dato[:octubre] + @dato[:noviembre]  + @dato[:diciembre])
    @dato[:total] = @total

    respond_to do |format|
      if @dato.save
        format.html { redirect_to datos_url, notice: 'Los datos se fue editaron con exitó.' }
        format.json { render :show, status: :ok, location: @dato }
      else
        format.html { render :edit }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datos/1
  # DELETE /datos/1.json
  def destroy
    @dato.destroy
    respond_to do |format|
      format.html { redirect_to datos_url, notice: 'Los datos se fue eliminaron con exitó.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dato
      @dato = Dato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dato_params
      params.require(:dato).permit(:indicator_id, :anio, :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre, :total, :porcentaje)
    end
end
