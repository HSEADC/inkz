class Admin::TattoosController < Admin::ApplicationController
  before_action :set_tattoo, only: %i[ show edit update destroy ]

  # GET /tattoos or /tattoos.json
  def index
    @tattoos = Tattoo.all
  end

  def by_tag
    @tattoos = Tattoo.tagged_with(params[:tag])
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
    @tattoo = Tattoo.new(title: params[:tattoo][:title], tag_list: params[:tattoo][:tag_list], style_list: params[:tattoo][:style_list], master_id: @master.id)
    @tattoo.master = @master
    @tattoo.user = nil  # Set the user to nil for admin-created tattoos

    if params[:tattoo][:tattoo_image].present?
      @tattoo.tattoo_image = params[:tattoo][:tattoo_image]
    else
      @tattoo.tattoo_image = ''
    end

    respond_to do |format|
      if @tattoo.save
        format.html { redirect_to admin_tattoo_url(@tattoo), notice: "Tattoo was successfully created." }
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
        format.html { redirect_to admin_tattoo_url(@tattoo), notice: "Tattoo was successfully updated." }
        format.json { render :show, status: :ok, location: admin_tattoos_url }
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
      format.html { redirect_to admin_tattoos_url, notice: "Tattoo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tattoo
      @tattoo = Tattoo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tattoo_params
      params.require(:tattoo).permit(:title, :specialization, :tattoo_image, :tag_list, :style_list)
    end
end
