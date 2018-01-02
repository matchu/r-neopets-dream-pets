class PetRequest < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :species
  belongs_to :color
  belongs_to :conversion_state
  belongs_to :minimum_name_quality, class_name: 'NameQuality'

  validates_presence_of :creator, :species, :color, :conversion_state, :minimum_name_quality

  validate :creator_can_add_pet_requests

  # After saving or destroying a PetRequest, delete the cache key for the
  # computation in the `recent_and_archived` static method.
  after_save do
    Rails.cache.delete 'pet_requests/recent_and_archived'
  end
  after_destroy do
    Rails.cache.delete 'pet_requests/recent_and_archived'
  end

  def creator_can_add_pet_requests
    unless creator.can_add_pet_requests?
      errors.add(:base, "You can only request #{creator.maximum_pet_requests} dream pets at once")
    end
  end

  def summary_string
    "#{conversion_state.name} #{minimum_name_quality.abbreviation} #{color.name} #{species.name}"
  end

  def PetRequest.recent_and_archived
    # This value is cached until 1 day has passed, or until a PetRequest is
    # saved/destroyed, whichever comes first. (This is because the value can
    # change both in response to the passage of time, or to a change in the
    # underlying data. For the saved/destroyed case, see the callbacks on this
    # model.)
    Rails.cache.fetch('pet_requests/recent_and_archived', expires_in: 1.day) do
      all_pet_requests = PetRequest.
        includes(:creator, :conversion_state, :species, :color, :minimum_name_quality).
        joins(:species, :color, :conversion_state).
        order('conversion_states.name, species.name, colors.name, pet_requests.created_at')
      
      recent_pet_requests = []
      archived_pet_requests = []
      all_pet_requests.each do |pet_request|
        if pet_request.updated_at >= 1.year.ago
          recent_pet_requests << pet_request
        else
          archived_pet_requests << pet_request
        end
      end

      {recent: recent_pet_requests, archived: archived_pet_requests}
    end
  end
end
