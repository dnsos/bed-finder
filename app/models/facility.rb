class Facility < ApplicationRecord
  has_many :beds, dependent: :destroy
end
