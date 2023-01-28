class Occupancy < ApplicationRecord
  include Rangeable

  belongs_to :bed
end
