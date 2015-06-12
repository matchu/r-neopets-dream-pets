class PetRequest < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :species
  belongs_to :color
  belongs_to :conversion_state
  belongs_to :minimum_name_quality, class_name: 'NameQuality'

  validates_presence_of :creator, :species, :color, :conversion_state, :minimum_name_quality
end
