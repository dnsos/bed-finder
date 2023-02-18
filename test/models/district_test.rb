require "test_helper"

class DistrictTest < ActiveSupport::TestCase
  test "creates district with valid attributes" do
    district = District.new(name: "Tempelhof-Schöneberg")
    district.valid?
    assert_empty district.errors
  end

  test "rejects district that already exists" do
    district = District.new(name: "Mitte")
    district.valid?
    assert_not district.errors[:name].empty?
  end

  test "rejects district with invalid attributes" do
    district = District.new
    district.valid?
    assert_not district.errors[:name].empty?
  end
end
