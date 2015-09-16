class Ability
  include CanCan::Ability

  def initialize(user)
   # Define abilities for the passed in user here
    
     user ||= User.new 
        if (user.email).nil? # guest user (not logged in) 
           user.role = "guest"
        end
        if user.role=="admin"
         can :manage, :all 
         cannot :manage, :id => user.id
         cannot :edit, User
         can :edit, User, :id => user.id
         cannot :update, User, :id => user.id
         cannot :destroy, User, :id=> user.id
        elsif user.role=="student"
         can :create, User
         can :update, Event
         can :update , :all
         can :read, :all
         cannot :read, Profile
         can :read, Profile, :id => user.profile.id
         can :destroy, User, :id => user.id
         cannot :update, User, :id => user.id
         cannot :edit, :all
         can :edit, Profile, :id => user.profile.id
        else
         can :create, User
        end
 end
end

