require 'rails_helper'

describe "the edit review process" do
  before(:each) do
    visit new_product_path
    click_link 'Sign up'
    fill_in 'user_email', with: 'lol@aol.com'
    fill_in 'user_password', with: 'dogdog'
    fill_in 'user_password_confirmation', with: 'dogdog'
    click_button 'Sign up'
    @user = User.last
    @user.update(admin: true)
    visit new_product_path
  end

  it "edits a review" do
    product = Product.create(:name => 'Hamburger', :cost => '10', :country => 'United States')
    review = Review.create(:author => 'Greg', :content_body => "This burger was the best burger I have ever eaten. It is amazing!", :rating => '5', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => 'Tim'
    click_on 'Update Review'
    expect(page).to have_content 'Tim'
  end

  it "returns error when author left blank" do
    product = Product.create(:name => 'Hamburger', :cost => '10', :country => 'United States')
    review = Review.create(:author => 'Greg', :content_body => "This burger was the best burger I have ever eaten. It is amazing!", :rating => '2', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => ''
    click_on 'Update Review'
    expect(page).to have_content 'error'
  end

  it "deletes reviews" do
    product = Product.create(:name => 'Hamburger', :cost => '10', :country => 'United States')
    review = Review.create(:author => 'Craig', :content_body => "This burger was the best burger I have ever eaten. It is amazing!", :rating => '5', :product_id => product.id)
    visit product_review_path(product, review)
    click_on 'Delete'
    expect(page).not_to have_content "This burger was the best burger I have ever eaten. It is amazing!"
  end
end