class Article < ApplicationRecord
  validates_presence_of :title, :author, :publish_date, :content, :thumb_image

  paginates_per 10

  after_save do |article|
    if article.published
      @users = User.where(newsletter: true).each do |user|
        UserMailer.article_email(user, article).deliver_now
      end
    end
  end
end
