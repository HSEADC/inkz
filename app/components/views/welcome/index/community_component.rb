class Views::Welcome::Index::CommunityComponent < ViewComponent::Base
  def initialize()
    @heading_text = 'присоединяйся <br /> к нашему сообществу'

    @socials = {
      vk: {
        link: 'https://vk.com/inkztattoo',
        content: 'socials/vk.svg'
      },
      dzen: {
        link: 'https://dzen.ru/id/6578c9cd5b0e751ba7c54f27',
        content: 'socials/dzen.svg'
      },
      'vc-ru': {
        link: 'https://vc.ru/u/3296881-stanislava-shestakova',
        content: 'socials/vc-ru.svg'
      },
      inst: {
        link: 'https://www.instagram.com/inkz_tattoo_/',
        content: 'socials/inst.svg'
      }
    }
  end
end
