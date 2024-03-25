class MastersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]  # Allow unauthenticated access to index and show

  # GET /masters or /masters.json
  def index
    if current_user&.is_master?
      # User has master privileges, display all masters
      @user_masters = Master.where(user: current_user)
      @other_masters = Master.where.not(user: current_user)
    else
      # User does not have master privileges, display only their master if it exists
      @user_masters = [current_user&.master].compact
      @other_masters = Master.where.not(user: current_user)
    end
    @masters = @user_masters + @other_masters
  end

  # GET /masters/1 or /masters/1.json
  def show
    @tattoos = @master.tattoos
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
    # @master.user = current_user # Set the user for this master

    respond_to do |format|
      if @master.save

        WaitAndMakeJob.perform_later(@master, current_user)

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
      if @master.update(master_params.except(:user_id))
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
      params.require(:master).permit(:name, :nickname, :specialization).merge(user_id: current_user.id)
    end
end
