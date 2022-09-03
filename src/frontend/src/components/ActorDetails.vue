<script>
    import axios from 'axios'

    export default {
	props: ['actor_id'],
	data(){
	    return {
		actor: false
	    }
	},
	mounted () {
	    this.loadActor();
	},
	methods: {
	    loadActor() {
		axios
		    .get(`/api/actors/${ this.actor_id }.json`)
		    .then(response => (this.actor = response.data) )
		    // TODO handle any errors
	    }
	},
	computed: {}
    }
</script>

<template>
    <b-tabs content-class="mt-3" v-if="actor">
	<b-tab title="Profile" active>
	    <img src="https://placekeanu.com/400/400/g" />
	    <h1>{{ actor.actor.first_name }} {{ actor.actor.last_name }}</h1>
	</b-tab>
	<b-tab title="Movies">
	    <MovieCard :movie="movie" v-for="movie in actor.movies"></MovieCard>
	</b-tab>
	<b-tab title="Genres">
	    TODO
	</b-tab>
    </b-tabs>
</template>

<style scoped>
</style>