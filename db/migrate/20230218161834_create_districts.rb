class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.string :name, null: false, index: { unique: true, name: "unique_names" }

      t.timestamps
    end
  end
end
