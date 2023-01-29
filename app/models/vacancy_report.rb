class VacancyReport
  include ActiveModel::Model

  attr_accessor :facility
  validates :facility, presence: true

  # Aggregates all genders and counts them (or something)
  def aggregate
    vacancy_report
  end

  private

  def vacancy_report
    array_with_all_permitted_genders =
      vacant_beds.flat_map { |bed| bed.permitted_genders }

    genders_tally = array_with_all_permitted_genders.tally

    { beds_count: vacant_beds.count, genders: genders_tally }
  end

  def vacant_beds
    facility_bed_ids = @facility.beds.pluck(:id)

    occupied_bed_ids =
      Occupancy.ongoing.where(bed_id: facility_bed_ids).pluck(:bed_id)

    unoccupied_bed_ids =
      facility_bed_ids.select { |bed_id| occupied_bed_ids.exclude? bed_id }

    @facility.beds.where(id: unoccupied_bed_ids)
  end
end
