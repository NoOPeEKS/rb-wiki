require 'net/http'
require 'json'
require 'reverse_markdown'

class Article < ApplicationRecord
  after_create :generate_markdown_file, if: -> { Rails.configuration.api_config['api_available'] }
  belongs_to :category
  has_rich_text :body
  belongs_to :user

  def generate_markdown_file
    markdown_content = construct_markdown
    send_markdown_to_api(markdown_content)
  end

  def construct_markdown
    markdown_body = ReverseMarkdown.convert(body)

    <<-MARKDOWN
      # #{title}
      **Author**: #{user.email}

      ## Category: #{category.name}

      ## Body:
      #{markdown_body}
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
