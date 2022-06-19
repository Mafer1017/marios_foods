require 'rails_helper'

describe "the add a product process" do
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

  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Hamburger'
    fill_in 'Cost', :with => '15'
    fill_in 'Country', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Hamburger'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end