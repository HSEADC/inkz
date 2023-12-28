class Api::V1::TattoosController < Api::V1::ApplicationController
  before_action :set_tattoos, only: [:by_part, :by_style]

  def index
    @tattoos = Tattoo.all
    render json: @tattoos
  end

  def show
  end

  def tags
    @parts_tags = Tattoo.tag_counts_on(:parts).pluck(:name)
    @styles_tags = Tattoo.tag_counts_on(:styles).pluck(:name)

    render json: { parts: @parts_tags, styles: @styles_tags }
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
end
