# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include Faker
#puts LordOfTheRings.location

Blog.destroy_all
Comment.destroy_all
# Product.destroy_all
# Article.destroy_all
100.times do
  # product = Product.create(
  #     name: Beer.name, description: Beer.style, quantity_on_hand: rand(1..20),
  #     low_price_range: rand(1..10), high_price_range: rand(10..20), cost_to_company: rand(1..6),
  #     shipping_weight: rand(1..5), thumb_image: Placeholdit.image("150x150"),
  #     full_image: Placeholdit.image("550x550")
  # )
  # rand(1..10).times do
  #   product.reviews.create(
  #       name: Name.first_name,
  #       review_text: Lorem.paragraph,
  #       rating: rand(1..5),
  #       created_at: Faker::Date.between(460.days.ago, Date.today)
  #   )
  # end
  # puts product.inspect
  #
  # article = Article.create(
  #     title: Book.title, author: Name.name, publish_date: Faker::Date.between(460.days.ago, Date.today),
  #     content: Lorem.paragraph, thumb_image: Avatar.image("my-own-slug", "100x100")
  # )
  # puts article.inspect
  blog = Blog.create(
      title: Book.title,
      publish_date: Faker::Date.between(460.days.ago, Date.today),
      author: Name.name,
      content: Lorem.paragraph
  )
  rand(1..5).times do
    blog.comments.create(
        author: StarWars.character,
        content: StarWars.quote,
        avatar_image: Avatar.image("my-own-slug", "100x100"),
        rating: rand(1..5)
    )
  end
end