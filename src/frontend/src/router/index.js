import { createRouter, createWebHistory } from 'vue-router'
import MovieList from '@/components/MovieList.vue'
import Welcome from '@/components/Welcome.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
	path: '/',
	name: 'welcome',
	component: () => import('@/components/Welcome.vue')
    },
    {
	path: '/movie/:movie_id',
	name: 'movie',
	component: () => import('@/components/MovieDetails.vue'),
	props: true
    },
    {
	path: '/actor/:actor_id',
	name: 'actor',
	component: () => import('@/components/ActorDetails.vue'),
	props: true
    }
  ]
})

export default router
