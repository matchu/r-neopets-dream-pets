class CreateConversionStates < ActiveRecord::Migration
  def change
    create_table :conversion_states do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
