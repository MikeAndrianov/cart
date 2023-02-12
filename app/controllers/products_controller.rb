class ProductsController < ApplicationController
  def index
    @products =
      Product
        .includes(:offers)
        .all
        .map(&method(:decorate))
  end

  private

  def decorate(product)
    ProductDecorator.new(product)
  end
end
