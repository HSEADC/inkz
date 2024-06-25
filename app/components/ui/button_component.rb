class Ui::ButtonComponent < ViewComponent::Base
  BUTTON_STYLES = {
    default: 'block w-fit px-5 py-2.5 text-lg text-center font-book border-2 duration-200 rounded-10',
    primary: 'bg-black text-white border-transparent hover:opacity-[85%]',
    secondary: 'bg-transparent text-black border-black hover:border-custom-dark-gray hover:text-custom-dark-gray hover:opacity-[85%]'
  }.freeze

  def initialize(text:, href: nil, variant: 'primary', className: '', **options)
    @className = [BUTTON_STYLES[:default], BUTTON_STYLES[variant.to_sym], className].compact.join(' ')
    @text = text
    @href = href
    @options = options
  end

  def call
    link_to @href, class: @className, **@options do
      @text
    end
  end
end
