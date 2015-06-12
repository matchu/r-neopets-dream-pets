class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.text :auth_hash

      t.timestamps null: false

      t.index [:provider, :uid]
    end
  end
end
