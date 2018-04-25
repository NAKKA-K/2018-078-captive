import Vue from 'vue'
import App from './App.vue'

import Resource from 'vue-resource'
Vue.use(Resource);

import VueI18n from 'vue-i18n'
Vue.use(VueI18n)

const data = require('./i18n/messages.json')
const i18n = new VueI18n({
  locale: 'ja',
  messages: data
})

new Vue({
  el: '#app',
  i18n: i18n,
  render: h => h(App)
})
