class Api::V1::MastersController < Api::V1::ApplicationController

  def index
    @masters = Master.all

    # render json: @masters
  end

  def show
    @master = Master.find(params[:id])
  end

  def create
    @user = User.find_by_jti(decrypt_payload[0]['jti'])
    @master = @user.master.new(master_params)

    if @master.save
      render json: @master.as_json
    else
      render json: @master.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def master_params
      params.require(:master).permit(:name, :nickname, :specialization)
    end
end
