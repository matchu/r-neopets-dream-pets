class CreatePetRequests < ActiveRecord::Migration
  def change
    create_table :pet_requests do |t|
      t.integer :species_id
      t.integer :color_id
      t.integer :conversion_state_id
      t.integer :minimum_name_quality_id
      t.text :info
      t.integer :creator_id
      t.boolean :requires_clothes

      t.timestamps null: false
    end
  end
end
