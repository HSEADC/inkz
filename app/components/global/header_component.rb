class Global::HeaderComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions

  def initialize(current_user:)
    @current_user = current_user
    @link_styles = 'hover:opacity-80 duration-200'
  end

  def admin?
    @current_user&.is_admin?
  end

  def not_admin?
    !admin?
  end

  def user_signed_in?
    @current_user.present?
  end
end
