class Review < ApplicationRecord
  belongs_to :product
  validates_presence_of :name, :review_text
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates_numericality_of :rating, greater_than_or_equal_to: 1
end
