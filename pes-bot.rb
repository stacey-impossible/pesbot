require 'telegram/bot'
require_relative 'token'
require_relative 'phrases'

Telegram::Bot::Client.run(Token.get) do |bot|
  bot.listen do |message|
    case
    when message.text.include?('/start')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getGreetings.sample
      )
    when message.text.include?('/pidor')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getPidor.sample
      )
    end
  end
end
