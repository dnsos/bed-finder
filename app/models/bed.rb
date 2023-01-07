class Bed < ApplicationRecord
  belongs_to :facility
  has_many :bookings, dependent: :destroy

  validates :permitted_genders, presence: true
end
