class Api::ProductsController < ApplicationController

  def all_product
    @products = Product.all
    render "products.json.jb"
  end

  def first_product
    @first_product = Product.first
    render "first_product.json.jb"
  end

  def second_product
    @second_product = Product.second
    render "second_product.json.jb"
  end

end
