class PetRequest < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :species
  belongs_to :color
  belongs_to :conversion_state
  belongs_to :minimum_name_quality, class_name: 'NameQuality'

  validates_presence_of :creator, :species, :color, :conversion_state, :minimum_name_quality

  validate :creator_can_add_pet_requests

  def creator_can_add_pet_requests
    unless creator.can_add_pet_requests?
      errors.add(:base, "You can only request #{creator.maximum_pet_requests} dream pets at once")
    end
  end

  def summary_string
    "#{conversion_state.name} #{minimum_name_quality.abbreviation} #{color.name} #{species.name}"
  end
end
