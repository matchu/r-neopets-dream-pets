class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    User.find_each { |user| user.name = user.auth_hash['info']['name']; user.save! }
  end
end
