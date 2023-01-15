class OccupanciesController < ApplicationController
  before_action :set_facility, only: %i[index new create terminate]
  before_action :set_beds, only: %i[index new create]
  before_action :set_occupancies, only: %i[index new create]
  before_action :set_available_beds, only: %i[new create]
  before_action :set_occupancy, only: %i[terminate]

  def index; end

  def show; end

  def new
    @occupancy = Occupancy.new
  end

  def create
    @occupancy = Occupancy.new(occupancy_params)
    @occupancy.started_at = Time.now

    respond_to do |format|
      if @occupancy.save
        format.html do
          redirect_to facility_occupancies_url(@facility),
                      notice: 'Occupancy was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def terminate
    respond_to do |format|
      @occupancy.terminate
      format.html { redirect_to facility_occupancies_url(@facility), notice: "Occupancy was successfully terminated." }
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
    @occupancies = Occupancy.includes(:bed).where(bed_id: @beds.ids).ongoing.today.order(started_at: :desc)
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
