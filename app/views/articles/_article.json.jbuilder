json.extract! article, :id, :title, :author, :publish_date, :published, :content, :thumb_image, :created_at, :updated_at
json.url article_url(article, format: :json)
