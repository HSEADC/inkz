import { Controller } from "@hotwired/stimulus"
import "https://unpkg.com/@appnest/masonry-layout?module";

export default class extends Controller {
  connect() {
    this.initMasonry()
  }

  initMasonry() {
    document.querySelector("masonry-layout").layout();
    new Masonry(grid, {
      itemSelector: ".tattoo-card",
      columnWidth: ".tattoo-card",
      percentPosition: true,
    })
  }
}