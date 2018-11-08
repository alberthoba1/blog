class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    guest_abilities
    user_abilities if @user.present?
    admin_abilities if @user.present? && @user.admin?
  end

  def guest_abilities
    can :read, Article
    cannot :create, Article
    cannot :destroy, Comment
    cannot :create, Comment
    cannot :manage, Message

  end

  def user_abilities
    can :update, Article, user: @user
    can :destroy, Article, user: @user
    can :create, Article
    can :create, Comment
    cannot :destroy, Comment
    cannot :read, Message
    can :create, Message
    cannot :destroy, Message
  end

  def admin_abilities
    can :manage, :all
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
