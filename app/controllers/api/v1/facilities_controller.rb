class Api::V1::FacilitiesController < ApplicationController
  before_action :set_facility, only: %i[show]

  def show
    render json: @facility
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end
end
