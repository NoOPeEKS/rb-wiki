require 'reverse_markdown'

class Article < ApplicationRecord
  after_create :generate_markdown_file
  belongs_to :category
  has_rich_text :body
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    puts markdown_content
  end

  def construct_markdown
    markdown_body = ReverseMarkdown.convert(body)

    <<-MARKDOWN
      # #{title}
      **Author**: John Doe

      ## Category: #{category.name}

      ## Body:
      #{markdown_body}
    MARKDOWN
  end
end
