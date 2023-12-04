module ApplicationHelper
  def can_modify_feedback?(feedback)
    current_user&.id == feedback.user_id || (current_user&.master&.id == feedback.master_id if current_user&.master)
  end
end
