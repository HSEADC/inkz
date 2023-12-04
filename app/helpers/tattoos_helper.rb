module TattoosHelper
  def can_modify_tattoo?(tattoo)
    user_signed_in? && (can?(:manage, tattoo.master) || tattoo.user == current_user)
  end
end
