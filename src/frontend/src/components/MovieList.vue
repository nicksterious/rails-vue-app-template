<script>
    import axios from 'axios'

    export default {
	data(){
	    return {
		movies: false
	    }
	},
	mounted(){
	    this.loadMovies()
	},
	methods: {
	    loadMovies(){
		axios
		    .get("/api/movies.json")
		    .then( response => { this.movies = response.data })
	    }
	}
    }
</script>

<template>
    <Search />
    <b-card-group deck>
	<MovieCard v-if="movies" :movie="movie" v-for="movie in movies"></MovieCard>
    </b-card-group>
</template>

<style scoped>
    div.search-form {
	position:relative;
    }
    input:focus::placeholder {
	color: transparent;
    }
    @media only screen and (max-width:1024px) {
	div.card-deck {
	    max-height: 50vh;
	}
    }
</style>