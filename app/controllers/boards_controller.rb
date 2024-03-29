class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /boards
  # GET /boards.json
  def index
    @boards = current_user.person.boards
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    begin
    current_user.person.boards << @board
    @board.ip = request.ip || 0
    rescue
      #do nothing for now
    end
    respond_to do |format|
      timezone = Timezone::Zone.new :latlon => [@board.latitude, @board.longitude]
      @board.timezone = timezone.active_support_time_zone
      if @board.save
        Board.initialize_dependencies(@board)#TODO add a delay here
        format.html { redirect_to edit_board_path(@board), notice: 'Board was successfully created.' }
        format.json { render action: 'show', status: :created, location: @board }
      else
        format.html { render action: 'new' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      puts board_params
      if @board.update(board_params)
        format.html { redirect_to static_dashboard_path, notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:address, :zipcode, :boardnumber, :boardmodel, :name, :description, :image, :timezone)
    end
end