# app/controllers/admin/application_controller.rb
class Admin::ApplicationController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path unless current_user&.is_admin?
  end
end
