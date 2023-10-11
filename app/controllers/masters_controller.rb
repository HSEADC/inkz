class MastersController < ApplicationController
  load_and_authorize_resource
  before_action :set_master, only: %i[ show edit update destroy ]

  # GET /masters or /masters.json
  def index
    @masters = Master.all
  end

  # GET /masters/1 or /masters/1.json
  def show
  end

  # GET /masters/new
  def new
    @master = Master.new
  end

  # GET /masters/1/edit
  def edit
  end

  # POST /masters or /masters.json
  def create
    @master = Master.new(master_params)
    @master.user = current_user # Set the user for this master

    respond_to do |format|
      if @master.save
        format.html { redirect_to master_url(@master), notice: "Master was successfully created." }
        format.json { render :show, status: :created, location: @master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masters/1 or /masters/1.json
  def update
    respond_to do |format|
      if @master.update(master_params)
        format.html { redirect_to master_url(@master), notice: "Master was successfully updated." }
        format.json { render :show, status: :ok, location: @master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masters/1 or /masters/1.json
  def destroy
    @master.destroy

    respond_to do |format|
      format.html { redirect_to masters_url, notice: "Master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master
      @master = Master.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_params
      params.require(:master).permit(:name, :nickname, :specialization)
    end
end
