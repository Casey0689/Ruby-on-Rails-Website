class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.datetime :publish_date
      t.boolean :published
      t.text :content
      t.string :thumb_image

      t.timestamps
    end
  end
end
