import EmblaCarousel from 'embla-carousel';
import Autoplay from 'embla-carousel-autoplay';

const OPTIONS = {
  loop: true,
};

const emblaNode = document.querySelector('.embla');
const viewportNode = emblaNode.querySelector('.embla__viewport');

const emblaApi = EmblaCarousel(viewportNode, OPTIONS, [Autoplay({ delay: 1500 })]);
