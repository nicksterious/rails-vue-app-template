<script>
    import axios from 'axios'
    import randomImage from '../random_image'
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
	computed: {
	    image(){
		return randomImage(200,200)
	    }
	}
    }
</script>

<template>
    <b-tabs content-class="m-3" v-if="actor">
	<b-tab title="Profile" active>
	    <img :src="image" />
	    <h1>{{ actor.actor.first_name }} {{ actor.actor.last_name }}</h1>
	</b-tab>
	<b-tab title="Movies">
	    <MovieCard :movie="movie" v-for="movie in actor.movies"></MovieCard>
	</b-tab>
	<b-tab title="Top 5 collaborators">
	    TODO
	</b-tab>
	<b-tab title="Genres">
	    TODO
	</b-tab>
    </b-tabs>
</template>

<style scoped>
    .card {
	width:100px;
	display: inline-block;
	margin:1%;
    }
</style>