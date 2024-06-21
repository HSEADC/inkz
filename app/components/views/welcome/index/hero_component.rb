class Views::Welcome::Index::HeroComponent < ViewComponent::Base
  def initialize()
    @heading_text = 'команда <span class="underline">inkz</span> поможет вам <br /> не&nbsp;ошибиться в&nbsp;выборе тату мастера'
    @caption_text = 'подпишитесь на рассылку, чтобы не пропустить <br class="sm:hidden" />запуск нашей платформы!'
  end
end
