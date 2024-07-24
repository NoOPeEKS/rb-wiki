class ChangeBodyFieldFromArticleToRichText < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :body, :rich_text
  end
end
