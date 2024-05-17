class Api::V1::TagsController < Api::V1::ApplicationController
  def index
    # all_tags = ActsAsTaggableOn::Tag.all

    # tags_parts = all_tags.select { |tag| tag.name.in?(%w[Wolf Viper Bear Cat Manticore Griffin]) }
    # tags_styles = all_tags.select { |tag| tag.name.in?(%w[Axii Quen Yrden Heliotrop]) }

    # render json: {
    #   parts: tags_parts,
    #   styles: tags_styles
    # }
  end
end
