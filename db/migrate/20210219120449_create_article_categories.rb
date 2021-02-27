class CreateArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_categories,id: false do |t|
      t.belongs_to :category
      t.belongs_to :article

      t.timestamps
    end
  end
end
