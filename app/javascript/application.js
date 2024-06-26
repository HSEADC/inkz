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
    button.addEventListener('click', function (e) {
      e.preventDefault()
      const tattooId = this.dataset.tattooId
      const csrfToken = document.querySelector('meta[name="csrf-token"]').content

      fetch(`/tattoos/${tattooId}/toggle_favorite`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken,
        },
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.status === 'added') {
            // Handle adding to favorites (e.g., change button appearance)
            this.classList.add('favorited')
          } else if (data.status === 'removed') {
            // Handle removing from favorites (e.g., change button appearance)
            this.classList.remove('favorited')
          }
        })
        .catch((error) => console.error('Error:', error))
    })
  })
})
