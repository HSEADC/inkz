class TattoosController < ApplicationController
  before_action :set_tattoo, only: %i[ show edit update destroy ]

  # GET /tattoos or /tattoos.json
  def index
    @tattoos = Tattoo.all
  end

  # GET /tattoos/1 or /tattoos/1.json
  def show
  end

  # GET /tattoos/new
  def new
    @tattoo = Tattoo.new
  end

  # GET /tattoos/1/edit
  def edit
  end

  # POST /tattoos or /tattoos.json
  def create
    @tattoo = Tattoo.new(tattoo_params)

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
    @tattoo.destroy

    respond_to do |format|
      format.html { redirect_to tattoos_url, notice: "Tattoo was successfully destroyed." }
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
      params.require(:tattoo).permit(:title, :specialization, :master_id)
    end
end
