class Ui::SocialComponent < ViewComponent::Base
  erb_template <<-ERB
    <a target="_blank" href="<%= @link %>" class="<%= @className %>">
      <img class="<%= @classNameIcon %> <%= @social.to_s == 'inst' ? 'blur-[2.5px]' : '' %>" src="<%= asset_path(@socials[@social][:content]) %>" alt="социальные сети inkz" />
    </a>
  ERB

  def initialize(social:, link: nil, className: '', classNameIcon: '')
    @socials = {
      tg: {
        link: 'https://t.me/bozzhik',
        content: 'socials/tg.svg'
      },
      vk: {
        link: 'https://vk.com/inkztattoo',
        content: 'socials/vk.svg'
      },
      inst: {
        link: 'https://www.instagram.com/inkz_tattoo_/',
        content: 'socials/inst.svg'
      },
      dzen: {
        link: 'https://dzen.ru/id/6578c9cd5b0e751ba7c54f27',
        content: 'socials/dzen.svg'
      },
      vc_ru: {
        link: 'https://vc.ru/u/3296881-stanislava-shestakova',
        content: 'socials/vc-ru.svg'
      },
    }

    defaultStyles = 'duration-200 bg-black hover:bg-opacity-80 rounded-[12px]'
    defaultIconStyles = 'object-contain s-16 sm:s-14'
    @className = [defaultStyles, className].compact.join(' ')
    @classNameIcon = [defaultIconStyles, classNameIcon].compact.join(' ')
    @social = social.to_sym
    @link = link || @socials[@social][:link]
  end
end
