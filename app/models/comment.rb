class Comment < ApplicationRecord
  belongs_to :blog

  validates_presence_of :author, :content
  validates_numericality_of :rating, :greater_than => 0, :less_than => 6
end
