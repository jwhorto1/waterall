class DailyweatheractualsController < ApplicationController
  before_action :set_dailyweatheractual, only: [:show, :edit, :update, :destroy]

  # GET /dailyweatheractuals
  # GET /dailyweatheractuals.json
  def index
    @dailyweatheractuals = Dailyweatheractual.all
  end

  # GET /dailyweatheractuals/1
  # GET /dailyweatheractuals/1.json
  def show
  end

  # GET /dailyweatheractuals/new
  def new
    @dailyweatheractual = Dailyweatheractual.new
  end

  # GET /dailyweatheractuals/1/edit
  def edit
  end

  # POST /dailyweatheractuals
  # POST /dailyweatheractuals.json
  def create
    @dailyweatheractual = Dailyweatheractual.new(dailyweatheractual_params)

    respond_to do |format|
      if @dailyweatheractual.save
        format.html { redirect_to @dailyweatheractual, notice: 'Dailyweatheractual was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dailyweatheractual }
      else
        format.html { render action: 'new' }
        format.json { render json: @dailyweatheractual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailyweatheractuals/1
  # PATCH/PUT /dailyweatheractuals/1.json
  def update
    respond_to do |format|
      if @dailyweatheractual.update(dailyweatheractual_params)
        format.html { redirect_to @dailyweatheractual, notice: 'Dailyweatheractual was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dailyweatheractual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyweatheractuals/1
  # DELETE /dailyweatheractuals/1.json
  def destroy
    @dailyweatheractual.destroy
    respond_to do |format|
      format.html { redirect_to dailyweatheractuals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailyweatheractual
      @dailyweatheractual = Dailyweatheractual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dailyweatheractual_params
      params.require(:dailyweatheractual).permit(:maxtemp, :mintemp, :zipcode, :wind, :precipitation, :summary, :apicource)
    end
end
