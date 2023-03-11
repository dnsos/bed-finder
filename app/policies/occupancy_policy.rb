class OccupancyPolicy < ApplicationPolicy
  attr_reader :user, :occupancy

  def initialize(user, occupancy)
    @user = user
    @occupancy = occupancy
  end

  def create?
    user.present? && occupancy.bed.facility.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
