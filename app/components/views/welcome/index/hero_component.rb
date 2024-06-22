class Views::Welcome::Index::HeroComponent < ViewComponent::Base
  def initialize()
    @heading_text = 'команда <span class="underline">inkz</span> поможет вам <br /> не&nbsp;ошибиться в&nbsp;выборе тату мастера'
    @caption_text = 'подпишитесь на рассылку, чтобы не пропустить <br class="sm:hidden" />запуск нашей платформы'

    @tattoo_block = {
      last: '-mt-14 sm:mt-0',
      pre_last: '-mt-2 sm:mt-0',
      center: 'mt-12 sm:mt-0'
    }

    @tattoo_structure = {
      1 => {
        className: "#{@tattoo_block[:last]} sm:hidden",
        image: 'index/card-tribals/tribal-2.svg',
        nickname: get_random_master_nickname
      },
      2 => {
        className: "#{@tattoo_block[:pre_last]} sm:hidden",
        image: 'index/card-tribals/tribal-4.svg',
        nickname: get_random_master_nickname
      },
      3 => {
        className: "#{@tattoo_block[:center]}",
        image: 'index/card-tribals/tribal-1.svg',
        nickname: '@bozzhik'
      },
      4 => {
        className: "#{@tattoo_block[:pre_last]} sm:hidden",
        image: 'index/card-tribals/tribal-5.svg',
        nickname: get_random_master_nickname
      },
      5 => {
        className: "#{@tattoo_block[:last]} sm:hidden",
        image: 'index/card-tribals/tribal-3.svg',
        nickname: get_random_master_nickname
      }
    }
  end

  def get_random_master_nickname
    masters = Master.all
    used_nicknames = []
    4.times do
      nickname = "@#{masters.where.not(nickname: used_nicknames).sample.nickname}"
      used_nicknames << nickname
    end
    used_nicknames.first
  end
end
