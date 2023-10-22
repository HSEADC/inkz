class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to tattoos_path, notice: exception.message }
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_admin
      admin_tattoos_path
    else
      tattoos_path
    end
  end

  def after_sign_out_path_for(resource)
    tattoos_path
  end
end
