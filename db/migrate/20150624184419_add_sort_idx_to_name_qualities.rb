class AddSortIdxToNameQualities < ActiveRecord::Migration
  def change
    add_column :name_qualities, :sort_idx, :integer
    add_index :name_qualities, :sort_idx
  end
end
