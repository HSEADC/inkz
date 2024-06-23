import * as Masonry from '@appnest/masonry-layout'

document.addEventListener('DOMContentLoaded', () => {
  const masonryGrid = document.querySelector('masonry-layout')
  if (masonryGrid) {
    masonryGrid.layout()
    // masonryGrid.gap = 50
  }
})
