class TriggersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_trigger, only: [:show, :edit, :update, :destroy]

  # GET /triggers
  # GET /triggers.json
  def index
    @triggers = Trigger.all
  end

  # GET /triggers/1
  # GET /triggers/1.json
  def show
  end

  # GET /triggers/new
  def new
    @trigger = Trigger.new
  end

  # GET /triggers/1/edit
  def edit
  end

  # POST /triggers
  # POST /triggers.json
  def create
    @trigger = Trigger.new(trigger_params)

    respond_to do |format|
      if @trigger.save
        Boardshortmessage.update_master_sm(@trigger)
        format.html { redirect_to edit_channel_path(@trigger.channel), notice: 'Trigger was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trigger }
      else
        format.html { render action: 'new' }
        format.json { render json: @trigger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /triggers/1
  # PATCH/PUT /triggers/1.json
  def update
    respond_to do |format|
      if @trigger.update(trigger_params)
        Boardshortmessage.update_master_sm(@trigger)
        format.html { redirect_to edit_channel_path(@trigger.channel), notice: 'Trigger was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trigger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /triggers/1
  # DELETE /triggers/1.json
  def destroy
    temp = @trigger
    @trigger.destroy
    respond_to do |format|
      format.html { redirect_to edit_channel_url(temp.channel) }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trigger
      @trigger = Trigger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trigger_params
      params.require(:trigger).permit(:channel_id, :weekday_id, :start_time, :duration, :weekday_int, :weekday_string, :short_status, :details)
    end
end

