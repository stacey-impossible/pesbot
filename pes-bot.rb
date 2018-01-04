require 'telegram/bot'
require_relative 'token'
require_relative 'phrases'

Telegram::Bot::Client.run(Token.get) do |bot|
  bot.listen do |message|
    case
    when message.text && message.text.include?('/start')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getGreetings.sample
      )
    when message.text && message.text.include?('/pidor')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getPidor.sample
      )
    when message.text && message.text.include?('Пэс')
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getRandom.sample
      )
    when message.new_chat_members.any?
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getNewMembers.sample
      )
    when message.left_chat_member
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: Phrases.getLeftMembers.sample
      )
    end
  end
end
