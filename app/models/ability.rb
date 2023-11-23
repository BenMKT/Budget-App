class Ability
  include CanCan::Ability

  def initialize()
    # Handle the case where we don't have a current_user i.e. the user is a guest
    User.new

    # Define a few sample abilities
    can :manage, Category
    can :manage, Transaction
  end
end
