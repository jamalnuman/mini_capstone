class Api::ProductsController < ApplicationController

  def index 
    @products = Product.all 
    render 'index.json.jb'
  end

  def show
    @product = Product.find(params[:id]) #remember this returns a string, but under the hood it will be converted to a number.
    render 'show.json.jb'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    
    @product.save
    render 'show.json.jb'

  end 

  def create
    @product = Product.new(
                            id: params[:id],
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            image_url: params[:image_url] #in order for these tags to show in insomnia or any other app, they must be here first 
                            )
    @product.save
    render 'show.json.jb'

  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product #{product.id} has successfully been destroyed."}
  end

end
