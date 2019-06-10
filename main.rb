# frozen_string_literal: true

require_relative 'translator'

loop do
  puts 'Введите слово для перевода. Нажмите \'q\' для выхода.' \
    ' Нажмите \'l\' для выбора списка языков.' \
    ' Нажмите \'r\' для показа текущего языка.'
  word = gets.chomp

  case word.downcase
  when 'q'
    puts 'bye'
    break
  when 'l'
    puts 'Выберите язык для перевода'
    puts '1. Англо-Русский'
    puts '2. Русско-Английский'
    lang = gets.chomp.to_i
    unless [1, 2].include? lang
      puts "Введено неверное значение #{lang}. Выбираю Англо-Русский"
      Yandex::Translator.current_lang = 1
      next
    end
    Yandex::Translator.current_lang = lang
  when 'r'
    puts Yandex::Translator.current_lang
  else
    puts Yandex::Translator.translate word
  end
end
