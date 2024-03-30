class TattoosController < ApplicationController
  include TattoosHelper
  load_and_authorize_resource
  before_action :set_tattoo, only: %i[ show edit update destroy ]

  # GET /tattoos or /tattoos.json
  def index
    @page = params[:page] || 1
    @tattoos = Tattoo.page @page

    # @tattoos = Tattoo.all
    @display_master = true

    if user_signed_in?  # Check if the user is signed in using your authentication logic
      @tattooos = current_user.tattoos
    else
      # Handle the case where the user is not authenticated
      # For example, you can display public content or a message
    end
  end

  def by_part
    @tattoos = Tattoo.tagged_with(params[:part])
    @display_master = true
    render :index
  end

  def by_style
    @tattoos = Tattoo.tagged_with(params[:style])
    @display_master = true
    render :index
  end

  # GET /tattoos/1 or /tattoos/1.json
  def show
    @display_master = true
    @master = @tattoo.master
  end


  # GET /tattoos/new
  def new
    @master = Master.find(params[:master_id])
    @tattoo = Tattoo.new
  end

  # GET /tattoos/1/edit
  def edit
    @master = @tattoo.master
  end

  # POST /tattoos or /tattoos.json
  def create
    @master = Master.find(params[:master_id])
    @tattoo = Tattoo.new(title: params[:tattoo][:title], part_list: params[:tattoo][:part_list], style_list: params[:tattoo][:style_list], master_id: @master.id)
    @tattoo.user = current_user


    if params[:tattoo][:tattoo_image].present?
      @tattoo.tattoo_image = params[:tattoo][:tattoo_image]
    else
      @tattoo.tattoo_image = ''
    end

    respond_to do |format|
      if @tattoo.save
        format.html { redirect_to tattoo_url(@tattoo), notice: "Tattoo was successfully created." }
        format.json { render :show, status: :created, location: @tattoo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tattoos/1 or /tattoos/1.json
  def update
    @master = @tattoo.master

    respond_to do |format|
      if @tattoo.update(tattoo_params)
        format.html { redirect_to tattoo_url(@tattoo), notice: "Tattoo was successfully updated." }
        format.json { render :show, status: :ok, location: @tattoo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tattoos/1 or /tattoos/1.json
  def destroy
    @master = @tattoo.master
    @tattoo.destroy

    respond_to do |format|
      format.html { redirect_to master_url(@master), notice: "Tattoo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tattoo
      @tattoo = Tattoo.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tattoo_params
      params.require(:tattoo).permit(:title, :specialization, :tattoo_image, :part_list, :style_list)
    end
end
