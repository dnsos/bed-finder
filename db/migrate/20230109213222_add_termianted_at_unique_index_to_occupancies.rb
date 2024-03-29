class AddTermiantedAtUniqueIndexToOccupancies < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL.squish
      CREATE UNIQUE INDEX bed_id_terminated_at_unique
        ON occupancies(bed_id, DATE_TRUNC('day', terminated_at))
    SQL
  end

  def down
    execute <<-SQL.squish
      DROP INDEX bed_id_terminated_at_unique
    SQL
  end
end
