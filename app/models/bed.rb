class Bed < ApplicationRecord
  belongs_to :facility
  has_many :bookings, dependent: :destroy
  has_many :occupancies, dependent: :destroy

  validates :permitted_genders, presence: true

  def id_and_permitted_genders
    "##{id}: #{permitted_genders.join(', ')}"
  end
end
