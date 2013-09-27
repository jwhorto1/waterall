class WaterallboardsController < ApplicationController
  before_action :set_waterallboard, only: [:show, :edit, :update, :destroy]

  # GET /waterallboards
  # GET /waterallboards.json
  def index
    @waterallboards = Waterallboard.all
  end

  # GET /waterallboards/1
  # GET /waterallboards/1.json
  def show
  end

  # GET /waterallboards/new
  def new
    @waterallboard = Waterallboard.new
  end

  # GET /waterallboards/1/edit
  def edit
  end

  # POST /waterallboards
  # POST /waterallboards.json
  def create
    @waterallboard = Waterallboard.new(waterallboard_params)

    respond_to do |format|
      if @waterallboard.save
        format.html { redirect_to @waterallboard, notice: 'Waterallboard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @waterallboard }
      else
        format.html { render action: 'new' }
        format.json { render json: @waterallboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waterallboards/1
  # PATCH/PUT /waterallboards/1.json
  def update
    respond_to do |format|
      if @waterallboard.update(waterallboard_params)
        format.html { redirect_to @waterallboard, notice: 'Waterallboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @waterallboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waterallboards/1
  # DELETE /waterallboards/1.json
  def destroy
    @waterallboard.destroy
    respond_to do |format|
      format.html { redirect_to waterallboards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waterallboard
      @waterallboard = Waterallboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waterallboard_params
      params.require(:waterallboard).permit(:latitude, :longitude, :address, :zipcode, :boardnumber, :boardmodel, :person_id, :channels)
    end
end
