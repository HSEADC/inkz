import * as Masonry from '@appnest/masonry-layout'

document.addEventListener('DOMContentLoaded', () => {
  const masonryGrid = document.querySelector('masonry-layout')
  if (masonryGrid) {
    masonryGrid.layout()
    // masonryGrid.gap = 50
    window.addEventListener('resize', () => {
      masonryGrid.layout()
    })
  }

  const colCountButton = document.querySelector('#col_count_button')
  const gapButton = document.querySelector('#gap_button')
  const maxColWidthButton = document.querySelector('#max_col_width_button')

  const CUSTOM_DEFAULT_MAX_COL_WIDTH = 400
  const CUSTOM_DEFAULT_COLS = 'auto'
  const GAP_PX = 20

  colCountButton.addEventListener('click', () => {
    const res = prompt(`Enter the amount of columns (default value is '${CUSTOM_DEFAULT_COLS}')`) || ''
    masonryGrid.cols = isNaN(res) ? CUSTOM_DEFAULT_COLS : Math.max(0, Math.min(parseInt(res), 30))
  })

  gapButton.addEventListener('click', () => {
    const res = prompt(`Enter the gap size in pixels (default value is '${GAP_PX}')`) || ''
    masonryGrid.gap = isNaN(res) ? GAP_PX : parseInt(res)
  })

  maxColWidthButton.addEventListener('click', () => {
    const res = prompt(`Enter the max col width in pixels (default value is '${CUSTOM_DEFAULT_MAX_COL_WIDTH}')`) || ''
    masonryGrid.maxColWidth = isNaN(res) ? CUSTOM_DEFAULT_MAX_COL_WIDTH : parseInt(res)
  })
})
