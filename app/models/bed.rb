class Bed < ApplicationRecord
  belongs_to :facility

  validates :permitted_genders, presence: true
end
