class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user #if the user is not authorized, then the unauthorized message from authenticate user will display to the user. 
 
  def index
     
      @carted_products = current_user.cart#check in the user model for the cart method..the reason it is in the user model cause the current user has to deal with the user's methods 
      #CartedProduct.where(status: "carted", user_id: current_user.id)#this allows the 
      #current_user.carted_products.where(status: 'carted')
      render 'index.json.jb'

    end





  def create 
    @carted_product = CartedProduct.new(
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted"
                                        )
    @carted_product.save
    render 'show.json.jb'
    
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    render json: {message: "This item has been removed from your cart!"}
  end


end
