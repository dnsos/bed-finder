class RemoveTextDistrictFromFacility < ActiveRecord::Migration[7.0]
  def change
    remove_column :facilities, :district, :text
  end
end
