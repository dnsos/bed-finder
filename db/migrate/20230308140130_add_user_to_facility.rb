# Adds a user_id column to each facility which references the users table.
# Note that it IS possible for a facility to not belong to a user, that's
# why it is nullifiable.
# This is because we want to add facilities first and later let an admin
# assign them to users.
class AddUserToFacility < ActiveRecord::Migration[7.0]
  def change
    add_reference :facilities, :user, foreign_key: true
  end
end
