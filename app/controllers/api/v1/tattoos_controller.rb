class Api::V1::TattoosController < Api::V1::ApplicationController
  before_action :set_tattoos, only: [:by_part, :by_style]

  def index
    @tattoos = Tattoo.all
    # @new_tattoo_url = new_api_v1_master_tattoo_url(master_id: 1)
  end

  def show
  end

  def tags
    @parts_tags = Tattoo.tag_counts_on(:parts).pluck(:name)
    @styles_tags = Tattoo.tag_counts_on(:styles).pluck(:name)

    render json: { parts: @parts_tags, styles: @styles_tags }
  end

  def create
    @user = User.find_by_jti(decrypt_payload[0]['jti'])

    if @user.present?
      @master = @user.master

      @tattoo = @master.tattoos.new(tattoo_params)
      @tattoo.user_id = @user.id

      if params[:tattoo][:tattoo_image].present?
        @tattoo.tattoo_image = params[:tattoo][:tattoo_image]
      end

      if @tattoo.save
        render json: @tattoo.as_json, status: :created
      else
        render json: @tattoo.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # def by_part
  #   @tags = Tattoo.tag_counts_on(:parts).pluck(:name)
  #   render json: { tags: @tags }
  # end

  # def by_style
  #   @tags = Tattoo.tag_counts_on(:styles).pluck(:name)
  #   render json: { tags: @tags }
  # end

  private

  def set_tattoos
    if params[:part]
      @tattoos = Tattoo.tagged_with(params[:part])
    elsif params[:style]
      @tattoos = Tattoo.tagged_with(params[:style])
    else
      @tattoos = Tattoo.all
    end
  end

  # Only allow a list of trusted parameters through.
  # def tattoo_params
  #   params.require(:tattoo).permit(:title, :tattoo_image, :part_list, :style_list)
  # end

  def tattoo_params
    params.require(:tattoo).permit(:title, :master_id, :tattoo_image)
  end

  # def tattoo_params
  #   params.require(:tattoo).permit(:title, :part_list, :style_list, :master_id)
  # end

end
