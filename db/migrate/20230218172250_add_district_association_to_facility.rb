class AddDistrictAssociationToFacility < ActiveRecord::Migration[7.0]
  def change
    add_reference :facilities, :district, foreign_key: true
  end
end
