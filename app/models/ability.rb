class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    user ||= User.new

    unless user.group
      can :crud, Group
    else
      can :read, Group
    end

    can :manage, Group, :user_owner => user.id
    can :manage, Category, :user_id => user.id
    can :manage, BankAccount, :user_id => user.id
    can :manage, Expense, :bank_account => { :user_id => user.id }
    can :manage, Salary, :bank_account => { :user_id => user.id }
    can :manage, User, :id => user.id
    can :manage, Summary, :user_id => user.id
    if user.group_id
      cannot :create, Group
    end
    can :read, User, User.all do |usr|
      usr.group.user_ids.includes(user.id)
    end

    cannot [:update, :destroy], Category, Category.all do |category|
      category.default
    end

    can :read, Summary, Summary.all do |summary|
      summary.can_watch?(user)
    end

  end
end
