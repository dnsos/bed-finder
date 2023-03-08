class Facility < ApplicationRecord
  has_many :beds, dependent: :destroy
  belongs_to :district, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true
end
