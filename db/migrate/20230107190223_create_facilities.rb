class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :district

      t.timestamps
    end
  end
end
