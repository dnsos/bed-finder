class VacanciesController < ApplicationController
  before_action :set_facility, only: %i[index]

  def index
    @vacancy_report = VacancyReport.new(facility: @facility).aggregate
  end

  private

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
