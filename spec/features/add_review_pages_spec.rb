require 'rails_helper'

describe "the add a review process" do
  before(:each) do
    visit new_product_path
    click_link 'Sign up'
    fill_in 'user_email', with: 'user@aol.com'
    fill_in 'user_password', with: 'dogdog'
    fill_in 'user_password_confirmation', with: 'dogdog'
    click_button 'Sign up'
  end


  it "adds a new review" do
    product = Product.create(:name => 'Hamburger', :cost => '15', :country => 'United States')
    visit product_path(product)
    click_link 'Add a review'
    fill_in 'Author', :with => "Craig"
    fill_in 'Content body', :with => "This burger was the best burger I have ever eaten. It is amazing!"
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Craig'
  end

  it "returns an error when form is left blank" do
    product = Product.create(:name => 'Hamburger', :cost => '15', :country => 'United States')
    visit product_path(product)
    click_link 'Add a review'
    click_on 'Create Review'
    expect(page).to have_content 'error'
  end
end