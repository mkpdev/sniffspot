class Spot < ApplicationRecord
    has_many_attached :images
    has_many :reviews,dependent: :destroy
    validates :title,:description,:price, presence: true
end
