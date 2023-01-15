module Occupancy::Terminable
  extend ActiveSupport::Concern

  included do
    scope :ongoing, -> { where(terminated_at: nil) }
    scope :today, -> { where("DATE_TRUNC('day', started_at) = ? OR DATE_TRUNC('day', started_at) = ?", Date.yesterday, Date.today) }
    scope :terminated, -> { where.not(terminated_at: nil) }
  end

  def terminate(time = Time.now)
    raise StandardError.new('Occupancy can not be terminated before it has started') if time < self.started_at

    update(terminated_at: time)
  end
end
