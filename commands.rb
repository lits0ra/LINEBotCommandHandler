require './command_handler'
require './util'
def help_message(event, client)
  message = message_template("このbotの使い方はこちらです。\n...")
  info_log(message)
  client.reply_message(event['replyToken'], message)
end

def message_template(reply_text)
  {
    type: 'text',
    text: reply_text
  }
end
