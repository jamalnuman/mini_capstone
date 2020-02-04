class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
     
    if current_user#this can be taken out cause of the #before_action :authenticate_user
      @carted_products = current_user.cart
      #CartedProduct.where(status: "carted", user_id: current_user.id)#this allows the 
      #current_user.carted_products.where(status: 'carted')
      render 'index.json.jb'
    # else
    #   render json: {}#this can be taken out cause of the #before_action :authenticate_user
    # end

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
