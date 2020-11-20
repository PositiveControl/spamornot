class AddSpamToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :spam, :boolean
  end
end
