class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :description, :thumb_image, :full_image
  validates_numericality_of :quantity_on_hand
  validates_numericality_of :low_price_range, :cost_to_company, :shipping_weight, :greater_than => 0.01
  validates_numericality_of :high_price_range, :less_than => 100000000.00

  paginates_per 10

  after_save do | product |
    @users = User.where(newsletter: true).each do | user |
      UserMailer.product_email(user, product).deliver_now
    end
  end

end
