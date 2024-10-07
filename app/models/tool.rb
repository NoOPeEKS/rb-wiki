require 'reverse_markdown'

class Tool < ApplicationRecord
  after_create :generate_markdown_file
  has_rich_text :usage
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    puts markdown_content
  end

  def construct_markdown
    markdown_usage = ReverseMarkdown.convert(usage)

    <<-MARKDOWN
    # Title: #{title}
    ## Type: #{tipus}
    ## Date: #{date}
    ## Repository link: #{code_repo_link}
    ## Document link: #{document_link}
    ## Units involved: #{units}
    ## Keywords: #{keywords}
    ## Technology: #{technology}
    ## Usage:
    #{markdown_usage}
    MARKDOWN
  end
end
