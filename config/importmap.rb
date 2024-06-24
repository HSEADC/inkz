# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "vanilla-tilt", to: "https://ga.jspm.io/npm:vanilla-tilt@1.8.1/lib/vanilla-tilt.js"
pin "embla-carousel", to: "https://ga.jspm.io/npm:embla-carousel@8.1.5/esm/embla-carousel.esm.js"
pin "embla-carousel-autoplay", to: "https://ga.jspm.io/npm:embla-carousel-autoplay@8.1.5/esm/embla-carousel-autoplay.esm.js"
pin "@appnest/masonry-layout", to: "https://ga.jspm.io/npm:@appnest/masonry-layout@2.2.3/index.js"
