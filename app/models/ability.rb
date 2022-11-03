class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Post, public: true

    return unless current_user.present? # additional permissions for logged in users (they can read their own posts)

    can :read, :all
    can :manage, Post, author: current_user
    can :manage, Comment, author: current_user

    return unless current_user.role == 'admin' # additional permissions for administrators

    can :manage, :all
  end

end
