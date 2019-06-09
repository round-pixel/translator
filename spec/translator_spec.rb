require_relative '../translator'

describe Yandex::Translator do
  context "translate" do
    it 'server can translate ru-en' do
      Yandex::Translator.current_lang = 1
      res = Yandex::Translator.translate('house')

      expect(res).to eq 'дом'
    end

    it 'server can translate en-run' do
      Yandex::Translator.current_lang = 2
      res = Yandex::Translator.translate('дом')

      expect(res).to eq 'house'
    end
  end
end
