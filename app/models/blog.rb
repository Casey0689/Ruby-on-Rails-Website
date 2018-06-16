class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :publish_date, :author, :content

  paginates_per 10

end
