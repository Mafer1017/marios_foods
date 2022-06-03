class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5,  only_integer: true }
  validates_length_of :author, maximum: 25
end