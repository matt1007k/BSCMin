class ProcesosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_processing, only: [:show, :edit, :update, :destroy]

    # GET /info
    # GET /info.json
    def index
        @informations = Information.all
        @processings = Processing.all
    end

    # GET /info/1
    # GET /info/1.json
    def show
    end

    # GET /info/new
    def new
        @processing = Processing.new
    end

    # GET /info/1/edit
    def edit
    end

    # POST /info
    # POST /info.json
    def create
        @processing = Processing.new(processing_params)

        respond_to do |format|
            if @processing.save
                format.html { redirect_to procesos_url, notice: 'El proceso fue creada con exitó.' }
                format.json { redirect_to @processing, status: :created, location: @processing }
            else
                format.html { render :new }
                format.json { render json: @processing.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /info/1
    # PATCH/PUT /info/1.json
    def update
        respond_to do |format|
            if @processing.update(processing_params)
                format.html { redirect_to procesos_url, notice: 'El proceso fue editada con exitó.' }
                format.json { redirect_to @processing, status: :ok, location: @processing }
            else
                format.html { render :edit }
                format.json { render json: @processing.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /info/1
    # DELETE /info/1.json
    def destroy
        @processing.destroy
        respond_to do |format|
            format.html { redirect_to procesos_url, notice: 'El proceso fue eliminada con exitó.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_processing
            @processing = Processing.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def processing_params
            params.require(:processing).permit(:title)
        end
end
