require './command_handler'
def help_message(event, client)
  message = message_template("このbotの使い方はこちらです。\n...")
  client.reply_message(event['replyToken'], message)
end

def message_template(reply_text)
  {
      type: 'text',
      text: reply_text
  }
end
