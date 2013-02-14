class StoreController < ApplicationController
  
  skip_before_filter :authorize
  def index
  	@search = Product.search do
    fulltext params[:search]
  end
  @products = @search.results
 
    @cart = current_cart
  end
end
