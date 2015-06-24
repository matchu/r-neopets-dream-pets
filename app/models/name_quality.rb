class NameQuality < ActiveRecord::Base
  scope :sorted, -> { order(:sort_idx) }
end
