class Ability
  include CanCan::Ability


  def initialize(user)
    #여기서 user는 -> current_user
      user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        #admin 권한
        can :manage, :all #7가지
        
      elsif user.has_role? :moder
        #moder 권한
        can :read, :all
        # can :delete, :all
        can :destroy, :all
        # can :new, :all
        # can :create, :all
        
      else
        #소시민 권한
        can :read, :all
        can :new, :all
        can :create, :all
        # can :update, Content, user_id: user.id #본인 글 만에 대해서 수정 가능.
        can :manage, Content, user_id: user.id
      end
  end


  # def initialize(user)
  #   # Define abilities for the passed in user here. For example:
  #   #
  #   #   user ||= User.new # guest user (not logged in)
  #   #   if user.admin?
  #   #     can :manage, :all
  #   #   else
  #   #     can :read, :all
  #   #   end
  #   #
  #   # The first argument to `can` is the action you are giving the user
  #   # permission to do.
  #   # If you pass :manage it will apply to every action. Other common actions
  #   # here are :read, :create, :update and :destroy.
  #   #
  #   # The second argument is the resource the user can perform the action on.
  #   # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  #   # class of the resource.
  #   #
  #   # The third argument is an optional hash of conditions to further filter the
  #   # objects.
  #   # For example, here the user can only update published articles.
  #   #
  #   #   can :update, Article, :published => true
  #   #
  #   # See the wiki for details:
  #   # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  # end
end
