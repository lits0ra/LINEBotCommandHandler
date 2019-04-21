require 'line/bot'
require './command_handler'
require './util'
class EventHandler < CommandHandler
  def execute(events, client)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          command_handler_execute(event, client)
          info_log('Event::MessageType::Text')
        end
      end
    end
  end
end