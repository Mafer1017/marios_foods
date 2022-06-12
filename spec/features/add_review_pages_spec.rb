require 'rails_helper'

describe "the add a review process" do
  before :each do
    Product.create!({name: 'booger', cost: '15', country: 'United States'})
    visit products_path
    click_link 'Booger'
    click_link 'Add a review'
  end


  it "adds a new review" do
    fill_in 'Author', :with => "Craig"
    fill_in 'Content body', :with => "This burger was the best burger I have ever eaten. It is amazing!"
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Craig'
  end

  it "returns an error when form is left blank" do
    click_on 'Create Review'
    expect(page).to have_content 'error'
  end
end