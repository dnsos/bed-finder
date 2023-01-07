require "test_helper"

class BookingTest < ActiveSupport::TestCase
  setup do
    @bed = beds(:three)
  end

  test "allows booking with valid attributes" do
    booking = Booking.new bed: @bed, checkin_date: Date.today, checkout_date: Date.today + 1.day

    booking.valid?
    assert_empty booking.errors
  end

  test "allows booking with equal checkin date and checkout date" do
    booking = Booking.new bed: @bed, checkin_date: Date.today, checkout_date: Date.today

    booking.valid?
    assert_empty booking.errors
  end

  test "rejects booking with checkin date before checkout date" do
    booking = Booking.new bed: @bed, checkin_date: Date.today + 1.day, checkout_date: Date.today

    booking.valid?
    assert_not booking.errors[:checkin_date].empty?
  end

  test "rejects booking a bed twice for the same dates" do
    # beds(:one) is already booked for these dates:
    booking = Booking.new bed: beds(:one), checkin_date: '2023-01-07', checkout_date: '2023-01-08'

    booking.valid?
    assert_not booking.errors[:checkin_date].empty?
    assert_not booking.errors[:checkout_date].empty?
  end
end
