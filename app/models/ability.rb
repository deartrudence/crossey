class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_super_admin?
        can :manage, :all 
    elsif user.is_principal?
        can [:create, :edit, :update, :show, :new], Profile, :user_id => user.id
        can [:update, :edit, :show, :index], Profile.by_job_type(user.profile.job_type).less_than_level(user.profile.job_level)
        can [:update, :edit, :show, :index], IndividualReview, :reviewer_id => user.id
        can [:manage], IndividualReview
        user_array = user.authored_reviews.map(&:employee_id)
        users = User.where(id: user_array)
        can [:update, :edit, :show], Profile do |profile|
            user_array.include?(profile.user_id)
        end
    elsif user.is_reviewer? 
        can [:create], IndividualReview
        can [:update, :edit, :show, :index, :download], IndividualReview, :reviewer_id => user.id
        can [:update, :edit, :show, :index], IndividualReview, :employee_id => user.id
        can [:update, :edit, :show], Profile, :user_id => user.id
        user_array = user.authored_reviews.map(&:employee_id)
        users = User.where(id: user_array)
        can [:update, :edit, :show], Profile do |profile|
            user_array.include?(profile.user_id)
        end
    elsif user.is_employee?
        can [:update, :edit, :show, :index], IndividualReview, :employee_id => user.id
        can [:update, :edit, :show], Profile, :user_id => user.id
    else
        can [:update, :edit, :show, :create, :new], Profile, :user_id => user.id
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
end
