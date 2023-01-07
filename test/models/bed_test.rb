require "test_helper"

class BedTest < ActiveSupport::TestCase
  setup do
    @facility = facilities(:one)
  end

  test "creates bed with valid attributes" do
    bed = Bed.new facility: @facility, permitted_genders: ["männlich"]

    bed.valid?
    assert_empty bed.errors
  end

  test "rejects bed with invalid attributes" do
    bed = Bed.new facility: @facility, permitted_genders: nil

    bed.valid?
    assert_not bed.errors[:permitted_genders].empty?
  end
end
