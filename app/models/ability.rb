class Ability
  include CanCan::Ability

  def initialize(user)
 
   # Define abilities for the passed in user here
    
     user ||= User.new # guest user (not logged in)
        if user.role=="admin"
         can :manage, :all 
        elsif user.role=="student"
         can :create, User
         can :read, :all
         can :destroy, User, :user_id => user.id
        else
          can :create , User
          cannot :create, Event 
          cannot :edit, :all
          cannot :destroy, :all
        end
 end
end

