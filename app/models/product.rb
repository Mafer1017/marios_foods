class Product < ApplicationRecord
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
    scope :local, -> { where(country: "United States") }
  has_many :reviews, dependent: :delete_all
  validates :name, presence: true
  validates :cost, presence: true
  validates :country, presence: true
  validates_length_of :name, maximum: 25

  before_save(:titleize_product)

 private
   def titleize_product
     self.name = self.name.titleize
     self.country = self.country.titleize
   end
end