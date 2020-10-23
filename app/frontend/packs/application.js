require("@rails/ujs").start()
// require ("twitter/bootstrap")
import 'bootstrap/dist/js/bootstrap'
import '../scripts/custom_scripts'
import '../scripts/map'
import '../styles/application'
import '../scripts/lightbox.min'

const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
