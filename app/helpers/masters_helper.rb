module MastersHelper
  def owns_master?(master)
    user_signed_in? && (can?(:manage, master) || master.user == current_user)
  end
end
