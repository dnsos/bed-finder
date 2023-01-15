class AddTimestampRangeToOccupancies < ActiveRecord::Migration[7.0]
  def change
    add_column :occupancies, :duration, :tsrange
  end
end
