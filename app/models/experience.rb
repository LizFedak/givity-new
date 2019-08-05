class Experience < ApplicationRecord
  belongs_to :user
  validates :listing_name, presence: true
end
