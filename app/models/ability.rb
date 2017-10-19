class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
    if admin.super_admin?
      can :manage, :all
    else
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :manage, Restaurant, admin_user: admin
      can :manage, Menu, restaurant_id: admin.restaurants
    end
  end
end
