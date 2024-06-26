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

  // favorite

  const favoriteButtons = document.querySelectorAll('.favorite-button')

  favoriteButtons.forEach((button) => {
    button.addEventListener('click', function (event) {
      event.preventDefault()

      const tattooData = {
        id: button.dataset.tattoo_id,
        title: button.dataset.tattoo_title,
        imageUrl: button.dataset.tattoo_image_url,
      }

      let favorites = JSON.parse(localStorage.getItem('favorites')) || []
      favorites.push(tattooData)

      localStorage.setItem('favorites', JSON.stringify(favorites))
    })

    // Set initial favorite state based on local storage
    const tattooData = {
      id: button.dataset.tattoo_id,
      title: button.dataset.tattoo_title,
      imageUrl: button.dataset.tattoo_image_url,
    }

    // You can optionally add the tattooData to favorites initially here if needed
  })
})
