class StoresController < ApplicationController

  # GET /stores
  # GET /stores.json
  def index
    @products = Product.page(params[:page].to_i)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @product = Product.find(params[:id])
  end

end
