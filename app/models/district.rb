class District < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :facilities, dependent: :nullify
end
