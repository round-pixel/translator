# frozen_string_literal: true

require 'rest-client'
require 'json'

module Yandex
  API_KEY = ENV['API_KEY']
  BASE_URL = 'https://translate.yandex.net/api/v1.5/tr.json/translate'
end

module Yandex
  class Translator
    @current_lang = 'ru'

    class << self
      attr_reader :current_lang

      def translate(word = '')
        params = { params: { key: API_KEY, text: word, lang: current_lang } }
        res = RestClient.get(BASE_URL, params)
        body = JSON.parse(res.body)
        body['text'].first
      rescue => _e
        'Неверный запрос'
      end

      def current_lang=(lang)
        case lang
        when 1
          @current_lang = 'ru'
        when 2
          @current_lang = 'en'
        end
      end
    end
  end
end
