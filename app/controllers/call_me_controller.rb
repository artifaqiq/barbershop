require 'telegram/bot'

class CallMeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_json!

  def call_me

    Telegram::Bot::Client.run(Rails.application.secrets.telegram_token) do |bot|
      bot.api.sendMessage(chat_id: Rails.application.secrets.telegram_chat_id, text: @json.to_s)
    end

    render :nothing => true,
           status: :ok

  rescue Exception => e
    render :nothing => true,
           status: :bad_request
  end

  private

  def check_json!
    @json = JSON.parse(request.body.read)
  rescue JSON::ParserError => e
    render :nothing => true,
           status: :bad_request

  end
end
