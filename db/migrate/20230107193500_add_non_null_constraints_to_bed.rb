class AddNonNullConstraintsToBed < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:beds, :permitted_genders, false)
  end
end
