require 'line/bot'

class EventHandler
  def execute(events, client)
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          p 'hi'
        end
      end
    }
  end
end