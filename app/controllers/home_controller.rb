class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
      @products = Product.all
      @products_most_recent = Product.three_most_recent
      @products_most_reviews = Product.most_reviews
      @products_local = Product.local
      render :index
  end
end