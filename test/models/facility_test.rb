require "test_helper"

class FacilityTest < ActiveSupport::TestCase
  test "creates facility with valid attributes" do
    facility = Facility.new name: "Test", district: "Mitte"

    facility.valid?
    assert_empty facility.errors
  end

  test "rejects facility with invalid attributes" do
    facility = Facility.new name: nil, district: nil

    facility.valid?
    assert_not facility.errors[:name].empty?
    assert_not facility.errors[:district].empty?
  end
end
