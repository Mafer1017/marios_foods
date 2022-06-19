require 'rails_helper'

describe "edit product process" do
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

  it "edits a product" do
    product = Product.create(:name => 'Hamburger', :cost => '15', :country => "United States")
    visit edit_product_path(product)
    fill_in 'Name', :with => 'French Fries'
    click_on 'Update Product'
    expect(page).to have_content 'French Fries'
  end

  it "returns an error if description is left blank" do
    product = Product.create(:name => 'Hamburger', :cost => '10', :country => 'France')
    visit edit_product_path(product)
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content 'error'
  end

  it "delete a product" do
    product = Product.create(:name => 'Hamburger', :cost => '10', :country => 'France')
    visit product_path(product)
    click_on 'Delete'
    expect(page).not_to have_content 'Hamburger'
  end
end