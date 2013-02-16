class StoreController < ApplicationController
  
  skip_before_filter :authorize
  def index
  	@products = Product.text_search(params[:query])
  
 
 
    @cart = current_cart
  end
end
