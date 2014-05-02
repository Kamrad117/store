class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    user ||= User.new                         #guest

    can :read, Category
    can :read, Product
    can :read, Asset

    if user.kind_of?(AdminUser)                #admin
      can :manage,:all
      cannot :destroy, AdminUser
      cannot :edit, AdminUser unless :id == user.id
      cannot :create, LineItem

    elsif user.kind_of?(User)                  #user
      can :read, Category
      can [:read, :create], Order, :user_id => user.id
      can :crud, Cart
      can :manage, LineItem
      cannot [:read, :edit], LineItem

    #   cannot :index, Product
    #   can [:read, :create], Order, :user_id => user.id
    #   can [:read, :destroy,:create,:update], Cart
    #   can :manage, LineItem
    #   cannot [:read, :edit], LineItem
    #   can :read , Comment
    #   cannot :index, Comment
    #   can :create, Comment
    #   can [:update, :destroy], Comment, :user_id => user.id
    # end
  end
end
