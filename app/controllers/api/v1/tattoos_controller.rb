class Api::V1::TattoosController < Api::V1::ApplicationController

  # GET /tattoos or /tattoos.json
  def index
    @tattoos = Tattoo.all

    render json: @tattoos
  end

  # GET /tattoos/1 or /tattoos/1.json
  def show
  end
end
