class StorefrontController < ApplicationController
  def all_items
  	@products = Product.all
  end

  def items_by_category
  	@category = Category.find(params[:category_id])
  	# @products = Product.where(category: params[:category_id])
  	# the line above is the same as the line below
  	@products = @category.products
  end

  def items_by_family
    @family = params[:family]
    @products = Product.where(family: @family)
  end
end
