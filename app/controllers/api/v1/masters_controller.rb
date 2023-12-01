class Api::V1::MastersController < Api::V1::ApplicationController

  def index
    @masters = Master.all

    # render json: @masters
  end

  def show
    @master = Master.find(params[:id])
  end
end
