class CreateBeds < ActiveRecord::Migration[7.0]
  def change
    create_table :beds do |t|
      t.references :facility, null: false, foreign_key: true
      t.string :permitted_genders, array: true

      t.timestamps
    end
  end
end
