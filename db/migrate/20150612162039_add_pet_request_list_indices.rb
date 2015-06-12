class AddPetRequestListIndices < ActiveRecord::Migration
  def change
    add_index :conversion_states, :name
    add_index :species, :name
    add_index :colors, :name
    add_index :pet_requests, :created_at
  end
end
