class ChangeSourceToSourceId < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :source, :source_id
    change_column :events, :source_id, :integer
  end
end
