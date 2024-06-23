# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "vanilla-tilt", to: "https://ga.jspm.io/npm:vanilla-tilt@1.8.1/lib/vanilla-tilt.js"
pin "embla-carousel", to: "https://ga.jspm.io/npm:embla-carousel@8.1.5/esm/embla-carousel.esm.js"
pin "embla-carousel-autoplay", to: "https://ga.jspm.io/npm:embla-carousel-autoplay@8.1.5/esm/embla-carousel-autoplay.esm.js"
pin "isotope-layout", to: "https://ga.jspm.io/npm:isotope-layout@3.0.6/js/isotope.js"
pin "desandro-matches-selector", to: "https://ga.jspm.io/npm:desandro-matches-selector@2.0.2/matches-selector.js"
pin "ev-emitter", to: "https://ga.jspm.io/npm:ev-emitter@1.1.1/ev-emitter.js"
pin "fizzy-ui-utils", to: "https://ga.jspm.io/npm:fizzy-ui-utils@2.0.7/utils.js"
pin "get-size", to: "https://ga.jspm.io/npm:get-size@2.0.3/get-size.js"
pin "masonry-layout", to: "https://ga.jspm.io/npm:masonry-layout@4.2.2/masonry.js"
pin "outlayer", to: "https://ga.jspm.io/npm:outlayer@2.1.1/outlayer.js"
