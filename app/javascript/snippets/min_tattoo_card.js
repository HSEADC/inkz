import VanillaTilt from 'vanilla-tilt'

document.addEventListener('DOMContentLoaded', () => {
  const elements = document.querySelectorAll("[data-tattoo='card']")
  const elementsArray = Array.from(elements)

  if (elementsArray.length > 0) {
    VanillaTilt.init(elementsArray, {
      max: 30,
      speed: 10000,
      glare: true,
      'max-glare': 0.3,
      reverse: true,
      reset: false,
      scale: 1.05,
    })
  }
})