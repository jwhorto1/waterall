class DailyweathersController < ApplicationController
  before_action :set_dailyweather, only: [:show, :edit, :update, :destroy]

  # GET /dailyweathers
  # GET /dailyweathers.json
  def index
    @dailyweathers = Dailyweather.all
  end

  # GET /dailyweathers/1
  # GET /dailyweathers/1.json
  def show
  end

  # GET /dailyweathers/new
  def new
    @dailyweather = Dailyweather.new
  end

  # GET /dailyweathers/1/edit
  def edit
  end

  # POST /dailyweathers
  # POST /dailyweathers.json
  def create
    @dailyweather = Dailyweather.new(dailyweather_params)

    respond_to do |format|
      if @dailyweather.save
        format.html { redirect_to @dailyweather, notice: 'Dailyweather was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dailyweather }
      else
        format.html { render action: 'new' }
        format.json { render json: @dailyweather.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailyweathers/1
  # PATCH/PUT /dailyweathers/1.json
  def update
    respond_to do |format|
      if @dailyweather.update(dailyweather_params)
        format.html { redirect_to @dailyweather, notice: 'Dailyweather was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dailyweather.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyweathers/1
  # DELETE /dailyweathers/1.json
  def destroy
    @dailyweather.destroy
    respond_to do |format|
      format.html { redirect_to dailyweathers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailyweather
      @dailyweather = Dailyweather.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dailyweather_params
      params.require(:dailyweather).permit(:apisource, :maxtemp, :mintemp, :wind, :precipitationprob, :summary, :zipcode)
    end
end
