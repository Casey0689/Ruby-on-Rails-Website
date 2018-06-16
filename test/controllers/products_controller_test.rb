require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { cost_to_company: @product.cost_to_company, description: @product.description, full_image: @product.full_image, high_price_range: @product.high_price_range, low_price_range: @product.low_price_range, name: @product.name, quantity_on_hand: @product.quantity_on_hand, shipping_weight: @product.shipping_weight, thumb_image: @product.thumb_image } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { cost_to_company: @product.cost_to_company, description: @product.description, full_image: @product.full_image, high_price_range: @product.high_price_range, low_price_range: @product.low_price_range, name: @product.name, quantity_on_hand: @product.quantity_on_hand, shipping_weight: @product.shipping_weight, thumb_image: @product.thumb_image } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
