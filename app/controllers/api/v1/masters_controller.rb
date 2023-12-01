class Api::V1::MastersController < Api::V1::ApplicationController

  # GET /masters or /masters.json
  def index
    @masters = Master.all

    render json: @masters
  end

  # GET /masters/1 or /masters/1.json
  def show
    @master = Master.find(params[:id])
  end
end
