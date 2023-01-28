module Occupancy::Rangeable
  extend ActiveSupport::Concern

  included do
    scope :ongoing, -> { where("upper(duration) IS NULL") }
    scope :today, -> {
 where("DATE_TRUNC('day', lower(duration)) = ? OR DATE_TRUNC('day', lower(duration)) = ?", Date.yesterday, Date.today) }
  end

  def terminate(end_time = Time.now)
    update(duration: duration.begin...end_time)
  end
end
