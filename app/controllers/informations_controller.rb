class InformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # GET /info
  # GET /info.json
  def index
    @informations = Information.all
  end

  # GET /info/1
  # GET /info/1.json
  def show
  end

  # GET /info/new
  def new
    @information = Information.new
  end

  # GET /info/1/edit
  def edit
  end

  # POST /info
  # POST /info.json
  def create
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to informations_url, notice: 'La információn fue creada con exitó.' }
        format.json { redirect_to @information, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info/1
  # PATCH/PUT /info/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to informations_url, notice: 'La információn fue editada con exitó.' }
        format.json { redirect_to @information, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info/1
  # DELETE /info/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to informations_url, notice: 'La információn fue eliminada con exitó.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:name, :mission, :vision, :macroproceso)
    end
end
