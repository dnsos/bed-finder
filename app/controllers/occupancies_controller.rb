class OccupanciesController < ApplicationController
  before_action :set_facility,
                only: %i[index new create terminate availabilities]
  before_action :set_beds, only: %i[index new create terminate availabilities]
  before_action :set_occupancies,
                only: %i[index new create terminate availabilities]
  before_action :set_available_beds,
                only: %i[new create terminate availabilities]
  before_action :set_occupancy, only: %i[terminate]

  def index
  end

  def availabilities
    @beds_count = @available_beds.count

    array_with_all_permitted_genders =
      @available_beds.flat_map { |bed| bed.permitted_genders }

    tallied_genders = array_with_all_permitted_genders.tally

    @men_count = tallied_genders["männlich"] || 0
    @women_count = tallied_genders["weiblich"] || 0
    @diverse_count = tallied_genders["divers"] || 0
  end

  def show
  end

  def new
    @occupancy = Occupancy.new
  end

  def create
    @occupancy = Occupancy.new(occupancy_params)
    @occupancy.duration = Time.now...Float::INFINITY

    respond_to do |format|
      if @occupancy.save
        @beds_count = @available_beds.count - 1

        @available_beds_men =
          @available_beds.select do |bed|
            bed.permitted_genders.include?("männlich")
          end

        @men_to_deduct =
          @occupancy.bed.permitted_genders.include?("männlich") ? 1 : 0

        @available_beds_women =
          @available_beds.select do |bed|
            bed.permitted_genders.include?("weiblich")
          end

        @women_to_deduct =
          @occupancy.bed.permitted_genders.include?("weiblich") ? 1 : 0

        @available_beds_diverse =
          @available_beds.select do |bed|
            bed.permitted_genders.include?("divers")
          end

        @diverse_to_deduct =
          @occupancy.bed.permitted_genders.include?("divers") ? 1 : 0

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

      @beds_count = @available_beds.count + 1

      array_with_all_permitted_genders =
        @available_beds.flat_map { |bed| bed.permitted_genders }

      tallied_genders = array_with_all_permitted_genders.tally

      @men_count =
        (tallied_genders["männlich"] || 0) +
          (@occupancy.bed.permitted_genders.include?("männlich") ? 1 : 0) || 0
      @women_count =
        (tallied_genders["weiblich"] || 0) +
          (@occupancy.bed.permitted_genders.include?("weiblich") ? 1 : 0) || 0
      @diverse_count =
        (tallied_genders["divers"] || 0) +
          (@occupancy.bed.permitted_genders.include?("divers") ? 1 : 0) || 0

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
