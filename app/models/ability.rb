class Ability
  include CanCan::Ability

  def initialize(user)
 
   # Define abilities for the passed in user here
    
     user ||= User.new # guest user (not logged in)
        if user.role=="admin"
         can :manage, :all 
         cannot :manage, :id => user.id
         cannot :edit, User
         can :edit, User, :id => user.id
         cannot :update, User, :id => user.id
         cannot :destroy, User, :id=> user.id
        elsif user.role=="student"
         can :create, User
         can :read, :all
         can :destroy, User, :id => user.id
         cannot :update, User, :id => user.id
        else
         can :create , User        
        end
 end
end

