require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country }
  it { should validate_length_of(:name).is_at_most(25) }
  it("titleizes the name of a product and its country of origin") do
    product = Product.create({name: "margherita pizza", cost: 15, country: "italy"})
    expect(product.name()).to(eq("Margherita Pizza"))
    expect(product.country()).to(eq("Italy"))
  end
end