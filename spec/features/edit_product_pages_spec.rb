require 'rails_helper'

describe "edit product process" do
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