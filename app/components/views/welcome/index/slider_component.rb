class Views::Welcome::Index::SliderComponent < ViewComponent::Base
  SLIDES_COUNT = 10

  def initialize()
    @tattoos = Tattoo.all
  end

  def get_random_tattoo_data
    used_titles = []
    SLIDES_COUNT.times.map do
      tattoo = @tattoos.where.not(title: used_titles).sample
      used_titles << tattoo.title
      tattoo
    end
  end
end
