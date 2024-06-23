import Isotope from 'isotope-layout'

document.addEventListener('DOMContentLoaded', () => {
  var elem = document.querySelector('.MASONRY_GRID')
  var iso = new Isotope(elem, {
    itemSelector: '.MASONRY_GRID_EL',
    layoutMode: 'masonry',
    masonry: {
      gutter: 10,
    }
  })
})