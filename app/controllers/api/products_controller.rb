class Api::ProductsController < ApplicationController

  def index
    @products = Product.all

    search_term = params[:search]
    discount_option = params[:discount]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    if search_term
      @products = @products.where("name iLIKE ?", "%#{ search_term }%")
    end

    if discount_option == "true"
      @products = @products.where("price < ?", 12)
    end

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    else
      @products = @products.order(:id)
    end

    render 'index.json.jb'
  end  

  # def index 
  #   @products = Product.all 
  #   render 'index.json.jb'
  # end

  def create
    @product = Product.new(
                            id: params[:id],
                            name: params[:name],
                            price: params[:price],
                            in_stock: params[:in_stock],
                            description: params[:description],
                            image_url: params[:image_url] #in order for these tags to show in insomnia or any other app, they must be here first 
                            )
    
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
                          #returns a hash with an array of error messages #unprocessable_entity is an error message that is returned to the user 
    end
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
    @product.in_stock = params[:in_stock] || @product.in_stock
    
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end

  end 

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product #{product.id} has successfully been destroyed."}
  end

end
