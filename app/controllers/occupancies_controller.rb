class OccupanciesController < ApplicationController
  before_action :set_facility, only: %i[index new create terminate]
  before_action :set_beds, only: %i[index new terminate]
  before_action :set_occupancies, only: %i[index new terminate]
  before_action :set_available_beds, only: %i[new terminate]
  before_action :set_occupancy, only: %i[terminate]

  def index
  end

  def show
  end

  def new
    @occupancy = Occupancy.new
  end

  def create
    @occupancy = Occupancy.new(occupancy_params)
    @occupancy.duration = Time.zone.now...Float::INFINITY

    respond_to do |format|
      if @occupancy.save
        @vacancy_report = VacancyReport.new(facility: @facility).aggregate

        format.turbo_stream

        format.html do
          redirect_to facility_occupancies_url(@facility),
                      notice: "Occupancy was successfully created."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def terminate
    respond_to do |format|
      @occupancy.terminate

      @vacancy_report = VacancyReport.new(facility: @facility).aggregate

      format.turbo_stream

      format.html do
        redirect_to facility_occupancies_url(@facility),
                    notice: "Occupancy was successfully terminated."
      end
    end
  end

  private

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  def set_beds
    @beds = @facility.beds
  end

  def set_occupancies
    @occupancies =
      Occupancy
        .includes(:bed)
        .where(bed_id: @beds.ids)
        .ongoing
        .order("lower(duration) DESC")
  end

  def set_available_beds
    @available_beds = @beds.where.not(id: @occupancies.pluck(:bed_id))
  end

  def set_occupancy
    @occupancy = Occupancy.find(params[:id])
  end

  def occupancy_params
    params.require(:occupancy).permit(:bed_id)
  end
end
