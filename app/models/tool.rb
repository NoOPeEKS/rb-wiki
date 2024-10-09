require 'reverse_markdown'

class Tool < ApplicationRecord
  after_create :generate_markdown_file, if: -> { Rails.configuration.api_config['api_available'] }
  has_rich_text :usage
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    send_markdown_to_api(markdown_content)
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

  def send_markdown_to_api(markdown_content)
    uri = URI('http://127.0.0.1:8080/index')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.body = { markdown: markdown_content }.to_json

    response = http.request(request)

    begin
      if response.is_a?(Net::HTTPSuccess)
        puts "Article markdown sent successfully to API"

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
