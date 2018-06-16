class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # POST /reviews
  # POST /reviews.json
  def create
    @product = Product.find(params[:product_id])
    @product.reviews.create(review_params)
    @product.save
    redirect_to store_show_path(@product.id)
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to products_path( @product.id )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :review_text, :rating, :product_id)
    end
end
