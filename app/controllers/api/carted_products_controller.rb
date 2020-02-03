class Api::CartedProductsController < ApplicationController
  def index
     
    if current_user 
      @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
      render 'index.json.jb'
    else
      render json: {}
    end

  end




  def create 
    @carted_product = CartedProduct.new(
                                        status: "carted",
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity]
                                        )
    if @carted_product.save
      render 'show.json.jb'
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
