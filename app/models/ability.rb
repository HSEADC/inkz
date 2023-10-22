# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
      # Users with is_admin = true can manage all resources
      can :manage, :all
    elsif user.is_master?
      can :manage, Tattoo 
    end

    can :read, Master
    can :read, Tattoo
    
    return unless user.present?
    can :create, Master
    can :manage, Master, user_id: user.id
    
    can :create, Tattoo
    can :manage, Tattoo, user_id: user.id

    # Define abilities for unauthenticated users (without an account)
    if user.nil?
      can :read, Master
      can :read, Tattoo
    end
  end
end
