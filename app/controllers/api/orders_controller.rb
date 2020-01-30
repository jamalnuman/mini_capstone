class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    if current_user #meaning if we have a current user logged on..display all their orders
      @orders = current_user.orders
      render 'index.json.jb' #this will refer to the partial file ..in this model named _order.json.jb
    else
      render json: [] 
    end
  end

 
def create
    #product = Product.find(params[:product_id])
    # calculated_subtotal = product.price * params[:quantity].to_i
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
                        user_id: current_user.id,
                        product_id: params[:product_id],
                        quantity: params[:quantity],
                        # subtotal: calculated_subtotal, 
                        # tax: calculated_tax,
                        # total: calculated_total
                      )

    @order.calculate_totals#this will go to the models page and execute calculate totals which will then calculate the methods within it and return a total.
    @order.save
    render 'show.json.jb'
  end
    

     def show 
    @order = Order.find(params[:id])#the id refers to the specific order you want to display..that is why there is a wildcard in the routes show action ..check route file
    render 'show.json.jb'
  end

  end

