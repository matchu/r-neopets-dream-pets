class CreateNameQualities < ActiveRecord::Migration
  def change
    create_table :name_qualities do |t|
      t.string :abbreviation

      t.timestamps null: false
    end
  end
end
