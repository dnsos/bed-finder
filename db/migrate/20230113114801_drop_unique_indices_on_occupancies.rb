class DropUniqueIndicesOnOccupancies < ActiveRecord::Migration[7.0]
  def change
    remove_index :occupancies, name: :bed_id_started_at_unique
    remove_index :occupancies, name: :bed_id_terminated_at_unique
  end
end
