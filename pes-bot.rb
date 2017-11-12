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
    when message.text.include?('Пэс')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getRandom.sample
      )
    when message.text.include?('joined the group via invite link')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getNewMembers.sample
      )
    when message.text.include?('left the group')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getLeftMembers.sample
      )
    end
  end
end
