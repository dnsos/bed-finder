class RemoveDeprecatedDurationColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :occupancies, :started_at
    remove_column :occupancies, :terminated_at
  end
end
