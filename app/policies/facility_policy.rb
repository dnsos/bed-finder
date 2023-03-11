class FacilityPolicy < ApplicationPolicy
  attr_reader :user, :facility

  def initialize(user, facility)
    @user = user
    @facility = facility
  end

  def index?
    true
  end

  def show?
    true
  end

  def administrate?
    user.present? && facility.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
