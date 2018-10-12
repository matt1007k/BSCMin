class AboutUsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  # GET /info
  # GET /info.json
  def index
    @infos = AboutU.all
  end

  # GET /info/1
  # GET /info/1.json
  def show
  end

  # GET /info/new
  def new
    @info = AboutU.new
  end

  # GET /info/1/edit
  def edit
  end

  # POST /info
  # POST /info.json
  def create
    @info = AboutU.new(about_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to about_us_url, notice: 'La információn fue creada con exitó.' }
        format.json { redirect_to @info, status: :created, location: @info }
      else
        format.html { render :new }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info/1
  # PATCH/PUT /info/1.json
  def update
    respond_to do |format|
      if @info.update(about_params)
        format.html { redirect_to about_us_url, notice: 'La információn fue editada con exitó.' }
        format.json { redirect_to @info, status: :ok, location: @info }
      else
        format.html { render :edit }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info/1
  # DELETE /info/1.json
  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to about_us_url, notice: 'La információn fue eliminada con exitó.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_us
      @info = AboutU.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_us_params
      params.require(:about_u).permit(:name, :mission, :vision, :macroproceso)
    end
end
