class Booking < ApplicationRecord
  belongs_to :bed

  validates :checkin_date, :checkout_date, presence: true
  validates :checkin_date, comparison: { less_than_or_equal_to: :checkout_date }
  validates :checkin_date, uniqueness: { scope: :bed_id, message: "Can not have two checkins for the same bed on the same day" }
  validates :checkout_date, uniqueness: { scope: :bed_id, message: "Can not have two checkouts for the same bed on the same day" }

end
