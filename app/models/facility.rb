class Facility < ApplicationRecord
  has_many :beds, dependent: :destroy

  validates :name, :district, presence: true
end
