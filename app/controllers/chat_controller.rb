require 'net/http'
require 'json'

class ChatController < ApplicationController
  def index
  end

  def send_message
    begin
      recieved_data = JSON.parse(request.raw_post)
      message = recieved_data["message"]

      puts("Missatge rebut: #{message}")
      api_url = Rails.configuration.api_config['api_url']
      uri = URI("#{api_url}/chat/ask?query=#{URI.encode_www_form_component(message)}")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri)
      response = http.request(request)

      puts response.body

      render json: {response: JSON.parse(response.body)["answer"]}, status: :ok
    rescue JSON::ParserError
      render json: { error: "Invalid JSON" }, status: :unprocessable_entity
    end
  end
end
