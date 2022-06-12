class HomeController < ApplicationController

  def index
      @products = Product.all
      @products_most_recent = Product.three_most_recent
      @products_most_reviews = Product.most_reviews
      @products_local = Product.local
      render :index
  end
end