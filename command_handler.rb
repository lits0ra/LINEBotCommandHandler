class CommandHandler
  @keyword_and_function = {}
  def initialize(client)
    @client = client
  end

  def regist_keyword_and_function(keyword, function)
    @keyword_and_function.store(keyword, function)
  end

  def command_handler_execute(event)
    text = event.message['text']
    @keyword_and_function[text].call(event) if @keyword_and_function.key?(text)
  end
end
