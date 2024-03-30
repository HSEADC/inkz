const defaultTheme = require('tailwindcss/defaultTheme')
const plugin = require('tailwindcss/plugin')

module.exports = {
  jit: true,
  content: ['./public/*.html', './app/helpers/**/*.rb', './app/javascript/**/*.js', './app/views/**/*.{erb,haml,html,slim}'],
  theme: {
    extend: {
      fontFamily: {
        sans: ['SuisseIntl', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        custom: {
          gray: '#ECECEC',
          'gray-dark': '#DCDCDC'
        },
      },
      width: {
        container: '88vw'
      },
      letterSpacing: {
        small: '-0.75px',
      }
    },
    screens: {
      xl: {max: '1536px'},
      lg: {max: '1280px'},
      md: {max: '810px'},
      sm: {max: '428px'},
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),

    plugin(function sizePlugin(api) {
      api.matchUtilities({s: (value) => ({width: value, height: value})}, {values: api.theme('width')})
    }),
  ],
}
