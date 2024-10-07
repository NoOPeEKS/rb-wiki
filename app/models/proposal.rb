require 'reverse_markdown'

class Proposal < ApplicationRecord
  after_create :generate_markdown_file
  has_rich_text :description
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    puts markdown_content
  end

  def construct_markdown
    markdown_description = ReverseMarkdown.convert(description)

    <<-MARKDOWN
    # Title: #{title}
    ## Type: #{tipus}
    ## Call: #{call}
    ## Domain: #{app_domain}
    ## Deadline: #{deadline}
    ## Duration: #{duration}
    ## Status: #{status}
    ## Clients: #{client}
    ## Units involved: #{units_involved}
    ## People involved: #{people_involved}
    ## Total budget: #{total_budget}
    ## Eurecat budget: #{eurecat_budget}
    ## Budget link: #{eurecat_budget_excel}
    ## Document link: #{document_link}
    ## Keywords: #{keywords}
    ## Description:
    #{markdown_description}
    MARKDOWN
  end
end
