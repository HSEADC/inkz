# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
      can :manage, Master
      can :manage, Tattoo
      can :manage, Feedback # Add this line to allow admins to manage all feedbacks
    elsif user.is_master?
      can :manage, Tattoo
    end

    can :read, Master
    can :read, Tattoo
    can :read, Feedback # Add this line to allow all users to read feedbacks

    return unless user.present?
    can :create, Master
    can :manage, Master, user_id: user.id

    can :create, Tattoo
    can :manage, Tattoo, user_id: user.id

    can :create, Feedback # Add this line to allow all users to create feedbacks
    can :manage, Feedback, user_id: user.id # Add this line to allow users to manage their own feedbacks

    # Define abilities for unauthenticated users (without an account)
    if user.nil?
      can :read, Master
      can :read, Tattoo
      can :read, Feedback
    end
  end
end
