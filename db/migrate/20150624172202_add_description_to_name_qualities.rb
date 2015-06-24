class AddDescriptionToNameQualities < ActiveRecord::Migration
  def change
    add_column :name_qualities, :description, :string, null: false, default: ''
  end
end
