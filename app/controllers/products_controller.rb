class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :email_product]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:edit, :update, :destroy, :new, :create]

  def email_product
    @users = User.where(newsletter: true)
    @users.each do |user|
      UserMailer.product_email(user, @product).deliver_now
    end
    redirect_to products_path, notice: "Product was successfully emailed"
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.page(params[:page].to_i)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :quantity_on_hand, :low_price_range, :high_price_range, :cost_to_company, :shipping_weight, :thumb_image, :full_image)
    end
end
