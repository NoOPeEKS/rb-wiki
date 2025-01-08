require 'reverse_markdown'

class Project < ApplicationRecord
  after_create :generate_markdown_file, if: -> { Rails.configuration.api_config['api_available'] }
  after_save :generate_markdown_file, if: -> { Rails.configuration.api_config['api_available'] }
  after_update :generate_markdown_file, if: -> { Rails.configuration.api_config['api_available'] }
  has_rich_text :description
  has_rich_text :result_summary
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    send_markdown_to_api(markdown_content)
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

  def send_markdown_to_api(markdown_content)
    api_url = Rails.configuration.api_config['api_url']
    uri = URI("#{api_url}/index")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.body = { markdown: markdown_content }.to_json

    response = http.request(request)

    begin
      if response.is_a?(Net::HTTPSuccess)
        puts "Project markdown sent successfully to API"

      elsif response.is_a?(Net::HTTPRedirection)
        puts "Recieved redirect response. Location #{response['location']}"
      else
        puts "Failed to send markdown to API. Response: #{response.code} #{response.message}"
      end
    rescue => e
      puts "Exception occured while sending request: #{e.message}"
    end
  end
end
