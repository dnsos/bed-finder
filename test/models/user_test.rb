require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user is not admin per default" do
    user = User.new
    user.valid?
    assert_not user.admin?
  end
end
