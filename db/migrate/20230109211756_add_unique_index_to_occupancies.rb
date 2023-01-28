class AddUniqueIndexToOccupancies < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL.squish
      CREATE UNIQUE INDEX bed_id_started_at_unique
        ON occupancies(bed_id, DATE_TRUNC('day', started_at))
    SQL
  end

  def down
    execute <<-SQL.squish
      DROP INDEX bed_id_started_at_unique
    SQL
  end
end
