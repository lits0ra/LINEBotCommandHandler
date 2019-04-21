require 'sinatra'
require 'line/bot'
require './event_handler'
require './functions'
def client
  @client ||= Line::Bot::Client.new do |config|
    config.channel_secret = ENV['LINE_CHANNEL_SECRET']
    config.channel_token = ENV['LINE_CHANNEL_TOKEN']
  end
end

# Add new command
new_command = CommandHandler.new
new_command.regist_keyword_and_function('使い方', method(:help_message))

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end
  events = client.parse_events_from(body)
  event_handler = EventHandler.new
  event_handler.execute(events, client)
end
