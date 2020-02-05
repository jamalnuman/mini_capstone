class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]
  #before action means to execute the following before anything else on the page, so authenticate the user only for the index and create action..meaning confirm the current_user for the actions below and render an authorized error if not logged in 

  def index
      @orders = current_user.orders#have to have a current user, if not, orders is being called on a nil class object and will break the application 
      render 'index.json.jb' #this will refer to the partial file ..in this model named _order.json.jb 
  end

 
  def create
      carted_products = current_user.cart
      subtotal = 0

      carted_products.each do |carted_product|
        subtotal += carted_product.product.price * carted_product.quantity
      end

      tax = subtotal * 0.09
      total = subtotal + tax

      @order = Order.new(
                        user_id: current_user.id, 
                        subtotal: subtotal, #this is the local variable from above
                        tax: tax,
                        total: total
                        )

      @order.save
      render 'show.json.jb'

    # @order = Order.new(
    #                     user_id: current_user.id,
    #                     product_id: params[:product_id],
    #                     quantity: params[:quantity],
                        # subtotal: calculated_subtotal, 
                        # tax: calculated_tax,
                        # total: calculated_total
                      #)
  end
    

    def show 
    @order = Order.find(params[:id])#the id refers to the specific order you want to display..that is why there is a wildcard in the routes show action ..check route file
    render 'show.json.jb'
    end

    def destroy
    order = Order.find(params[:id])
    order.destroy
    render json: {message: "Product successfully destroyed"}
    end

  end

