// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails'
import 'controllers'

import './snippets/min_tattoo_card'
import './snippets/index_slider'
import './snippets/tattoos_grid'

document.addEventListener('DOMContentLoaded', () => {
  const filterButton = document.getElementById('TATTOO_FILTERS_BTN')
  const filtersElement = document.getElementById('TATTOO_FILTERS')

  filterButton?.addEventListener('click', (e) => {
    e.preventDefault()
    filtersElement.classList.toggle('hidden')
  })
})
