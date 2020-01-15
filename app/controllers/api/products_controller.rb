class Api::ProductsController < ApplicationController

  def all_product
    @products = Product.all
    render "products.json.jb"
  end

end
