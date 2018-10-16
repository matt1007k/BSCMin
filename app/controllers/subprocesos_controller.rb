class SubprocesosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_subprocess, only: [:show, :edit, :update, :destroy]

    # GET /info
    # GET /info.json
    def index
        @subprocesses = SubProcess.all
    end

    # GET /info/1
    # GET /info/1.json
    def show
    end

    # GET /info/new
    def new
        @proceso_id = params[:proceso_id]
        @subprocess = SubProcess.new
    end

    # GET /info/1/edit
    def edit
        @proceso_id = params[:proceso_id]
    end

    # POST /info
    # POST /info.json
    def create
        @subprocess = SubProcess.new(subprocess_params)

        respond_to do |format|
        if @subprocess.save
            format.html { redirect_to procesos_url, notice: 'El subproceso fue creada con exitó.' }
            format.json { redirect_to @subprocess, status: :created, location: @subprocess }
        else
            format.html { render :new }
            format.json { render json: @subprocess.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /info/1
    # PATCH/PUT /info/1.json
    def update
        respond_to do |format|
        if @subprocess.update(subprocess_params)
            format.html { redirect_to procesos_url, notice: 'El subproceso fue editada con exitó.' }
            format.json { redirect_to @subprocess, status: :ok, location: @subprocess }
        else
            format.html { render :edit }
            format.json { render json: @subprocess.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /info/1
    # DELETE /info/1.json
    def destroy
        @subprocess.destroy
        respond_to do |format|
        format.html { redirect_to procesos_url, notice: 'El subproceso fue eliminada con exitó.' }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_subprocess
            @subprocess = SubProcess.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def subprocess_params
            params.require(:sub_process).permit(:title, :processing_id)
        end
end
