require 'rake'
class BoardshortmessagesController < ApplicationController
  before_action :set_boardshortmessage, only: [:show, :edit, :update, :destroy]
  # GET /boardshortmessages
  # GET /boardshortmessages.json
  def index
    @boardshortmessages = Boardshortmessage.all
  end
  # GET /boardshortmessages/1
  # GET /boardshortmessages/1.json
  def show
    @boardshortmessage = Boardshortmessage.find(params[:id])
    #system "rake boardshortmessage:manipulate --trace"
    #Rake::Task["boardshortmessage:manipulate"].invoke
    @boardshortmessage.update_board_schedule
    render json: @boardshortmessage
  end

  # GET /boardshortmessages/new
  def new
    @boardshortmessage = Boardshortmessage.new
  end

  # GET /boardshortmessages/1/edit
  def edit
  end

  # POST /boardshortmessages
  # POST /boardshortmessages.json
  def create
    @boardshortmessage = Boardshortmessage.new(boardshortmessage_params)
    respond_to do |format|
      if @boardshortmessage.save && Boardshortmessage.encode_4_board(@boardshortmessage)
        format.html { redirect_to boardshortmessages_url, notice: 'Boardshortmessage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @boardshortmessage }
      else
        format.html { render action: 'new' }
        format.json { render json: @boardshortmessage.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /boardshortmessages/1
  # PATCH/PUT /boardshortmessages/1.json
  def update
    respond_to do |format|
      if @boardshortmessage.update(boardshortmessage_params) && Boardshortmessage.encode_4_board(@boardshortmessage)
        format.html { redirect_to boardshortmessages_url, notice: 'Boardshortmessage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @boardshortmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boardshortmessages/1
  # DELETE /boardshortmessages/1.json
  def destroy
    @boardshortmessage.destroy
    respond_to do |format|
      format.html { redirect_to boardshortmessages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardshortmessage
      @boardshortmessage = Boardshortmessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boardshortmessage_params
      params.require(:boardshortmessage).permit(:board_id, :channel1_on_in_seconds, :channel2_on_in_seconds, :channel3_on_in_seconds, :channel4_on_in_seconds, :channel5_on_in_seconds, :channel6_on_in_seconds, :channel7_on_in_seconds, :channel8_on_in_seconds, :randomaccesscode, :scalediv32, :date, :year, :month, :day, :hour, :minute, :second, :channel1, :channel2, :channel3, :channel4, :channel5, :channel6, :channel7, :channel8, :sendstatus, :echo, :willsend, :checksum, :concatinated_board_ascii)
    end
end
