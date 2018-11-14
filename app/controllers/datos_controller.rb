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
    @indicador = Indicator.find(params[:dato][:indicator_id])
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

    @porcentaje = 0.0
    @indicador.datos.each do |dato|
      if @indicador.tipo == 'porcentaje'
        if @indicador.datos.count >= 1
          
          @porcentaje = '%.2f' % ((@total / (@indicador.datos.sum(:total).to_f + @total)) * 100)
        else
          @porcentaje = 0
        end        
      elsif @indicador.tipo == 'reducir'
        if @indicador.datos.count >= 1
          @porcentaje = '%.2f' % (((dato.total.to_f - @total)*100) /  dato.total.to_f)
          @dato[:anterior] = dato.id
        else
          @porcentaje = 0
        end
      elsif @indicador.tipo == 'incremento'
        if @indicador.datos.count >= 1
          @porcentaje = '%.2f' % (((@total - dato.total.to_f)*100) /  @total)
          @dato[:anterior] = dato.id
        else
          @porcentaje = 0
        end
      else
        @porcentaje = 0
      end
    end
    #render json: @porcentaje
    #puts @indicador.datos.sum(:total).to_f + @total
    #puts @porcentaje
#=begin
    @dato[:porcentaje] = @porcentaje
    
    respond_to do |format|
      if @dato.save
        @indicador.datos.each do |dato|
          if @indicador.tipo == 'porcentaje'
            if @indicador.datos.count >= 1              
              dato[:porcentaje] = '%.2f' % ((dato[:total] / @indicador.datos.sum(:total).to_f) * 100)
              dato.save
            end 
          end
        end

        format.html { redirect_to datos_url, notice: 'Los datos se fue crearon con exitó.' }
        format.json { render :show, status: :created, location: @dato }
      else
        format.html { render :new }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
#=end
  end

  # PATCH/PUT /datos/1
  # PATCH/PUT /datos/1.json
  def update
    @dato[:indicator_id] = params[:dato][:indicator_id]
    @indicador = Indicator.find(@dato[:indicator_id])
    
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

    @total = (@dato[:enero] + @dato[:febrero] + @dato[:marzo] + @dato[:abril] + @dato[:mayo]+ @dato[:junio] + @dato[:julio] + @dato[:agosto] + @dato[:septiembre] + @dato[:octubre] + @dato[:noviembre]  + @dato[:diciembre])
    
    @diferencia = 0
    if @dato[:total] != @total
      @diferencia = @dato[:total] - @total
    end
    
    @id = @dato[:id]
    @porcentaje = 0.0
    @indicador.datos.each do |dato|
      if @indicador.tipo == 'porcentaje'
        if @indicador.datos.count >= 1
          if @dato[:total] != @total
            @diferencia = @dato[:total] - @total
            @porcentaje = '%.2f' % ((@total / (@indicador.datos.sum(:total).to_f - @diferencia)) * 100)
          else
            @porcentaje = '%.2f' % ((@dato[:total] / @indicador.datos.sum(:total).to_f) * 100)
          end
        else
          @porcentaje = 0
        end
      elsif @indicador.tipo == 'reducir'
        if @indicador.datos.count >= 1
          if @dato[:total] != @total
            if  @id == dato.id
              @anterior = Dato.find(dato.anterior)
              @porcentaje = '%.2f' % (((@anterior[:total] - @total)*100) / @anterior[:total])
              puts "Total año anterior: #{@anterior[:total]}" 
            end
          else
            @porcentaje = dato.porcentaje
          end
          puts @total
          puts @indicador.datos.sum(:total)
          puts @porcentaje 
        else
          @porcentaje = 0
        end
      elsif @indicador.tipo == 'incremento'
        if @indicador.datos.count >= 1
          if @dato[:total] != @total
            if  @id == dato.id
              @anterior = Dato.find(dato.anterior)
              @porcentaje = '%.2f' % (((@total - @anterior[:total])*100) / @total)
            end
          else
            @porcentaje = dato.porcentaje
          end
        else
          @porcentaje = 0
        end
      else
        @porcentaje = 0
      end
    end
    #render json: @porcentaje
    #puts (@total / (@indicador.datos.sum(:total).to_f - @diferencia)) * 100
    #puts @total 
    #puts @porcentaje 
    #puts @indicador.datos.sum(:total).to_f - @diferencia

    @dato[:total] = @total
    @dato[:porcentaje] = @porcentaje
    
#=begin    
    respond_to do |format|
      if @dato.save
        
        @indicador.datos.each do |dato_db|
          if @indicador.tipo == 'porcentaje'
            if @indicador.datos.count >= 1  
              if  @id == dato_db[:id]
                  dato_db[:porcentaje] = '%.2f' % ((@total / @indicador.datos.sum(:total).to_f) * 100)
              else
                  dato_db[:porcentaje] = '%.2f' % ((dato_db[:total] / @indicador.datos.sum(:total).to_f) * 100)
              end     
              #dato_db[:porcentaje] = '%.2f' % ((dato_db[:total] / @indicador.datos.sum(:total).to_f) * 100)
              dato_db.save
            end 
          end
        end
        #return true
        format.html { redirect_to datos_url, notice: 'Los datos se fue editaron con exitó.' }
        format.json { render :show, status: :ok, location: @dato }
      else
        format.html { render :edit }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
#=end
  end

  # DELETE /datos/1
  # DELETE /datos/1.json
  def destroy
    
    @indicador = Indicator.find(@dato[:indicator_id])
    @indicador.datos.each do |dato|
      if @indicador.tipo == 'porcentaje'
        if @indicador.datos.count >= 1 
          @dato.destroy             
          dato[:porcentaje] = '%.2f' % ((dato[:total] / @indicador.datos.sum(:total).to_f) * 100)
          dato.save
        end 
      else
        @dato.destroy
      end
    end

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
