# frozen_string_literal: true

class Views::Welcome::Team::HeroComponent < ViewComponent::Base
  def initialize()
    @heading_text = 'кто такие <span class="underline">inkz</span>?'
    @caption_text = 'мы&nbsp;создаём удобный и&nbsp;информативный сервис, который поможет вам найти идеального тату-мастера.'
    @caption_text_mobile = 'мы&nbsp;создаём удобный сервис, который поможет вам найти идеального тату-мастера.'

    @aboutData = {
      bozzhik: {
        link: 'https://bozzhik.ru/',
        image: 'about/bozzhik.jpg',
        caption: 'разработчик продукта'
      },
      stasia: {
        link: 'https://t.me/stanislavasal',
        image: 'about/stasia.jpg',
        caption: 'дизайнер продукта'
      },
      zakharday: {
        link: 'https://t.me/dayglobal',
        image: 'about/zakharday.jpg',
        caption: 'куратор по коду'
      },
      vadim: {
        link: 'https://t.me/m1d45',
        image: 'about/vadim.jpg',
        caption: 'куратор по дизайну'
      },
      dima: {
        link: 'https://t.me/dmalex_brf',
        image: 'about/dima.jpg',
        caption: 'куратор по коду'
      }
    }
  end

  def avatar_styles
    {
      wrapper: 'group relative h-32 xl:h-24 sm:h-[23vw] hover:z-[50] hover:scale-105 duration-200 -mx-2.5 hover:mx-0',
      image: 'overflow-hidden rounded-full border-[4px] border-[#222] s-full',
      caption: 'absolute bg-black text-white text-center leading-[1.10] rounded-md px-2 py-2 w-full opacity-0 group-hover:opacity-100 -bottom-[60px] left-0 s-fit sm:-bottom-16 sm:text-xs sm:leading-none',
    }
  end
end
