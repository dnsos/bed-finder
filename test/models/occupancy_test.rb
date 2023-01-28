require "test_helper"

class OccupancyTest < ActiveSupport::TestCase
  setup do
    @bed = beds(:three)
  end

  test "allows occupancy with valid attributes" do
    occupancy = Occupancy.new bed: @bed, started_at: Time.now

    occupancy.valid?
    assert_empty occupancy.errors
  end

  test "rejects occupancy with invalid terminated_at" do
    now = Time.now
    occupancy = Occupancy.new bed: @bed, started_at: now, terminated_at: now - 10.minutes

    occupancy.valid?
    assert_not occupancy.errors[:terminated_at].empty?
  end
end
