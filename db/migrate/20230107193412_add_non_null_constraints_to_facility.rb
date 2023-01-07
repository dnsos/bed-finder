class AddNonNullConstraintsToFacility < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:facilities, :name, false)
    change_column_null(:facilities, :district, false)
  end
end
