class Api::V1::TattoosController < Api::V1::ApplicationController

  def index
    @tattoos = Tattoo.all

    # render json: @tattoos
  end

  def show
  end
end
