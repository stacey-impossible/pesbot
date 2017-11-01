require 'telegram/bot'
require 'token.rb'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start@paysagebot'
      bot.api.sendMessage(chat_id: message.chat.id, text: "ИДИТЕ НАХУЙ БЛЯДЬ")
    when '/pidor@paysagebot'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Ебать ты петушара")
    end
  end
end
