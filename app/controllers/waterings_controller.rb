class WateringsController < ApplicationController
  before_action :set_watering, only: [:show, :edit, :update, :destroy]

  # GET /waterings
  # GET /waterings.json
  def index
    @waterings = Watering.all
  end

  # GET /waterings/1
  # GET /waterings/1.json
  def show
  end

  # GET /waterings/new
  def new
    @watering = Watering.new
  end

  # GET /waterings/1/edit
  def edit
  end

  # POST /waterings
  # POST /waterings.json
  def create
    @watering = Watering.new(watering_params)

    respond_to do |format|
      if @watering.save
        format.html { redirect_to @watering, notice: 'Watering was successfully created.' }
        format.json { render action: 'show', status: :created, location: @watering }
      else
        format.html { render action: 'new' }
        format.json { render json: @watering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waterings/1
  # PATCH/PUT /waterings/1.json
  def update
    respond_to do |format|
      if @watering.update(watering_params)
        format.html { redirect_to @watering, notice: 'Watering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @watering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waterings/1
  # DELETE /waterings/1.json
  def destroy
    @watering.destroy
    respond_to do |format|
      format.html { redirect_to waterings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watering
      @watering = Watering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watering_params
      params.require(:watering).permit(:time, :version, :channel, :user_id)
    end
end
