class Product < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates_length_of :name, maximum: 25
end