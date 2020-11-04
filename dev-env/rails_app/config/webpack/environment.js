const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const path = require('path')

// Config
environment.config.merge(require('./config/resolve'))

environment.loaders.append('expose', {
  test: require.resolve('jquery', {
    paths: [ path.resolve(__dirname, '..', '..', 'vendor/theme/stisla/node_modules/jquery')]
  }),
  loader: 'expose-loader',
  options: {
    exposes: [
      {
      globalName: 'jQuery',
      override: true
      },
      {
        globalName: '$',
        override: true
      },
    ]
  }
})

module.exports = environment
