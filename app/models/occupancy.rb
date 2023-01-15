class Occupancy < ApplicationRecord
  include Terminable

  belongs_to :bed

  validates :started_at, presence: true
  validates :terminated_at, comparison: { greater_than: :started_at },
    if: -> { terminated_at.present? }
end
