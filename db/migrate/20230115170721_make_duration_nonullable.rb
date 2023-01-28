class MakeDurationNonullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :occupancies, :duration, false
  end
end
