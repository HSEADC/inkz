const defaultTheme = require('tailwindcss/defaultTheme')
const plugin = require('tailwindcss/plugin')

module.exports = {
  jit: true,
  content: ['./public/*.html', './app/helpers/**/*.rb', './app/javascript/**/*.js', './app/views/**/*.{erb,haml,html,slim}', './app/views/**/**/*.{erb,haml,html,slim}', './app/components/**/*.{erb,rb,haml,html,slim}', './app/components/constants.rb'],
  theme: {
    extend: {
      fontFamily: {
        sans: ['SuisseIntl', ...defaultTheme.fontFamily.sans],
      },
      fontWeight: {
        book: '450',
      },
      colors: {
        custom: {
          gray: '#737373',
          'dark-gray': '#333'
        },
      },
      borderRadius: {
        10: '10px',
      },
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
