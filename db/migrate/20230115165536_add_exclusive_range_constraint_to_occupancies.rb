class AddExclusiveRangeConstraintToOccupancies < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL.squish
      CREATE EXTENSION btree_gist;

      ALTER TABLE occupancies
        ADD CONSTRAINT bed_id_duration_exclusive_range
        EXCLUDE USING GIST (bed_id WITH =, duration WITH &&);
    SQL
  end

  def down
    execute <<-SQL.squish
      DROP CONSTRAINT bed_id_duration_exclusive_range;
      DROP EXTENSION btree_gist;
    SQL
  end
end
