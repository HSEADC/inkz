import * as Masonry from '@appnest/masonry-layout'

document.addEventListener('DOMContentLoaded', () => {
  const masonryGrid = document.querySelector('masonry-layout')
  if (masonryGrid) {
    const layoutMasonry = () => {
      masonryGrid.layout()

      if (window.innerWidth <= 768) {
        masonryGrid.cols = 2
        masonryGrid.gap = 7
      }
    }

    layoutMasonry()
    window.addEventListener('resize', layoutMasonry)
  }

  const gridConfigBlock = document.querySelector('#masnory-config')
  const gridConfigButton = document.querySelector('#GRID_CONFIG_BTN')

  const colCountButton = document.querySelector('#col_count_button')
  const gapButton = document.querySelector('#gap_button')
  const resetButton = document.querySelector('#reset_button')
  const closeButton = document.querySelector('#close_button')

  const CUSTOM_DEFAULT_COLS = 'auto'
  const GAP_PX = 20

  colCountButton?.addEventListener('click', () => {
    const res = prompt(`Введите количество колонок (по умолчанию: '${CUSTOM_DEFAULT_COLS}')`) || ''
    masonryGrid.cols = isNaN(res) ? CUSTOM_DEFAULT_COLS : Math.max(0, Math.min(parseInt(res), 30))
  })

  gapButton?.addEventListener('click', () => {
    const res = prompt(`Введите размер промежутков (по умолчанию: '${GAP_PX}')`) || ''
    masonryGrid.gap = isNaN(res) ? GAP_PX : parseInt(res)
  })

  resetButton?.addEventListener('click', () => {
    masonryGrid.gap = GAP_PX
    masonryGrid.cols = CUSTOM_DEFAULT_COLS
  })

  gridConfigButton?.addEventListener('click', () => {
    gridConfigBlock.classList.remove('translate-y-20')
    gridConfigBlock.querySelectorAll('.translate-y-20').forEach((element) => {
      element.classList.remove('translate-y-20')
    })
  })

  closeButton?.addEventListener('click', () => {
    gridConfigBlock.classList.add('translate-y-20')
    gridConfigBlock.querySelectorAll('.bg-black.text-white.rounded-md').forEach((element) => {
      element.classList.add('translate-y-20')
    })
  })
})
