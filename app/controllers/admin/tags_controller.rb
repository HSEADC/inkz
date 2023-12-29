class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all  # Assuming you are using ActsAsTaggableOn for tagging
  end
end
