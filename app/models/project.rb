require 'reverse_markdown'

class Project < ApplicationRecord
  after_create :generate_markdown_file
  has_rich_text :description
  has_rich_text :result_summary
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    puts markdown_content
  end

  def construct_markdown
    markdown_description = ReverseMarkdown.convert(description)
    markdown_summary = ReverseMarkdown.convert(result_summary)

    <<-MARKDOWN
    # Title: #{title}
    ## Type: #{tipus}
    ## Call: #{call}
    ## Domain: #{app_domain}
    ## Start date: #{start_date}
    ## End date: #{end_date}
    ## Duration in months: #{duration}
    ## Clients: #{client}
    ## Units involved: #{units_involved}
    ## People involved: #{people_involved}
    ## Total budget: #{total_budget}
    ## Eurecat budget: #{eurecat_budget}
    ## Budget link: #{eurecat_budget_excel}
    ## Repository link: #{code_repos}
    ## Deliverables link: #{deliverables}
    ## Presentation link: #{presentation}
    ## Data sources: #{data_sources}
    ## Keywords: #{keywords}
    ## Description:
    #{markdown_description}
    ## Result summary:
    #{markdown_summary}
    MARKDOWN
  end
end
