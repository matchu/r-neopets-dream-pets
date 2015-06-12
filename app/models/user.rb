class User < ActiveRecord::Base
  serialize :auth_hash

  has_many :pet_requests, foreign_key: 'creator_id'

  def can_edit_pet_request?(pet_request)
    pet_request.creator_id == id || admin?
  end

  def editable_pet_requests
    if admin?
      PetRequest.all
    else
      pet_requests
    end
  end

  def self.from_auth_hash(auth_hash)
    User.find_or_initialize_by(provider: auth_hash['provider'], uid: auth_hash['uid']).tap do |user|
      user.name = auth_hash['info']['name']
      user.auth_hash = auth_hash
      user.save!
    end
  end
end
