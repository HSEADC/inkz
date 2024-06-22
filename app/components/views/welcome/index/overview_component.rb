class Views::Welcome::Index::OverviewComponent < ViewComponent::Base
  def initialize()
    @heading_text = 'кто такие <span class="underline">inkz</span>?'
    @caption_text = 'мы — медиа-сервис, который объединяет тату-мастеров и людей, которые хотят сделать татуировку или найти идеи для эскизов'
  end
end
