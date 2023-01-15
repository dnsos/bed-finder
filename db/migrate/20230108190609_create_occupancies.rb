class CreateOccupancies < ActiveRecord::Migration[7.0]
  def change
    create_table :occupancies do |t|
      t.references :bed, null: false, foreign_key: true
      t.datetime :started_at, null: false
      t.datetime :terminated_at

      t.timestamps

      t.check_constraint "started_at < terminated_at", name: "started_at_before_terminated_at"
    end
  end
end
