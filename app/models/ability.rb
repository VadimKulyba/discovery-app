class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :new, :create, to: :create
    alias_action :index, :show, to: :read
    alias_action :destroy, to: :delete
    can :update, User, id: user.id if user.present?
    begin
      if user.role == 'admin'
        can :manage, :all
      else
        can %i[read], User
        can %i[read], Region
        can %i[read], Teleshow
        can %i[read], Expedition
        can %i[create delete], Form
      end
    rescue NoMethodError
      can %i[read], User
      can %i[read], Region
      can %i[read], Teleshow
      can %i[read], Expedition
      can %i[create delete], Form
    end
  end
end
