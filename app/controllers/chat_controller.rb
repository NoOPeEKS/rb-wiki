class ChatController < ApplicationController
  def index
  end

  def send_message
    render json: { response: "ola"}
  end
end
