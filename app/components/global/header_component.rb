class Global::HeaderComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
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
