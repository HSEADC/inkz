class Admin::MastersController < Admin::ApplicationController

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
    @users = User.all
    # Add this line to check the value of @users
    p @users
    @master = Master.new
  end

  # GET /masters/1/edit
  def edit
    @users = User.all
  end

  # POST /masters or /masters.json
  def create
    @master = Master.new(master_params)
    # @master.user = current_user # Set the user for this master

    respond_to do |format|
      if @master.save
        format.html { redirect_to admin_master_url(@master), notice: "Master was successfully created." }
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
        format.html { redirect_to admin_master_url(@master), notice: "Master was successfully updated." }
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
      format.html { redirect_to admin_masters_url, notice: "Master was successfully destroyed." }
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
      params.require(:master).permit(:name, :nickname, :specialization, :user_id)
    end

    def authorize_admin
      redirect_to root_path unless current_user&.is_admin?
    end
end
