require 'line/bot'
require './command_handler'

class EventHandler < CommandHandler
  def execute(events)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          command_handler_execute(event)
        end
      end
    end
  end
end