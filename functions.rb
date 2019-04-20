def help_message(event)
  message = message_template("このbotの使い方はこちらです。\n...")
  @client.reply_message(event['replyToken'], message)
end

private
def message_template(reply_text)
  {
      type: 'text',
      text: reply_text
  }
end