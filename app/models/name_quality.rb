class NameQuality < ApplicationRecord
  scope :sorted, -> { order(:sort_idx) }
end
