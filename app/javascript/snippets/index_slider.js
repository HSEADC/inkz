import EmblaCarousel from 'embla-carousel'
import Autoplay from 'embla-carousel-autoplay'

document.addEventListener('DOMContentLoaded', () => {
  if (document.querySelector('.embla')) {
    const emblaNode = document.querySelector('.embla')
    const viewportNode = emblaNode.querySelector('.embla__viewport')

    const OPTIONS = {
      loop: true,
    }

    const emblaApi = EmblaCarousel(viewportNode, OPTIONS, [Autoplay({delay: 1500})])
  }
})
