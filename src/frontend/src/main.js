import { BootstrapVue3 } from 'bootstrap-vue-3'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import { RouterLink, RouterView } from 'vue-router'
import MovieCard from '@/components/MovieCard.vue'
import MovieList from '@/components/MovieList.vue'
import ActorCard from '@/components/ActorCard.vue'
import ActorDetails from '@/components/ActorDetails.vue'
import Search from '@/components/Search.vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-3/dist/bootstrap-vue-3.css'
import './assets/bootstrap.css'

import './assets/main.css'

const app = createApp(App)


app.use(router)
app.use(BootstrapVue3)

app.component('MovieCard', MovieCard)
app.component('MovieList', MovieList)
app.component('ActorCard', ActorCard)
app.component('ActorDetails', ActorDetails)
app.component('Search', Search)
app.mount('#app')
