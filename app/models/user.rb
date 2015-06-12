class User < ActiveRecord::Base
  serialize :auth_hash

  def name
    auth_hash['info']['name']
  end

  def self.from_auth_hash(auth_hash)
    User.find_or_initialize_by(provider: auth_hash['provider'], uid: auth_hash['uid']).tap do |user|
      user.auth_hash = auth_hash
      user.save!
    end
  end
end
