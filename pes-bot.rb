require 'telegram/bot'
require_relative 'token'
require_relative 'phrases'

Telegram::Bot::Client.run(Token.get) do |bot|
  bot.listen do |message|
    case message.text
    when '/start@paysagebot'
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getGreetings[rand(Phrases.getGreetings.length)]
      )
    when '/pidor@paysagebot'
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getPidor[rand(Phrases.getPidor.length)]
      )
    end
  end
end
