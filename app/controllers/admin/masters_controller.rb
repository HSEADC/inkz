class Admin::MastersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_admin! # Make sure the user is an admin

  # GET /admin/masters or /admin/masters.json
  def index
    @masters = Master.all
  end

  # GET /admin/masters/1 or /admin/masters/1.json
  def show
    @tattoos = @master.tattoos
  end

  # GET /admin/masters/new
  def new
    @master = Master.new
  end

  # GET /admin/masters/1/edit
  def edit
  end

  # POST /admin/masters or /admin/masters.json
  def create
    @master = Master.new(master_params)

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

  # ...

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master
      @master = Master.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_params
      params.require(:master).permit(:name, :nickname, :specialization)
    end

    def authenticate_admin!
      redirect_to root_path, alert: "Access denied." unless current_user&.is_admin?
    end
end
