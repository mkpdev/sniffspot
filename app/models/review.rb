class Review < ApplicationRecord
  belongs_to :spot
  validates :content, presence: true

end
