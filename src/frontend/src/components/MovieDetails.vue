<script>
    import axios from 'axios'
    import randomImage from '../random_image'
    export default {
	props: ['movie_id'],
	data(){
	    return {
		movie: false
	    }
	},
	mounted(){
	    this.loadMovie()
	},
	methods: {
	    loadMovie() {
		axios
		    .get(`/api/movies/${ this.movie_id }.json`)
		    .then( response => { this.movie = response.data })
	    }
	},
	computed: {
	    image(){
		return randomImage(300, 450)
	    }
	},
	watch: {
	    movie_id(){
		this.loadMovie()
	    }
	}
    }
</script>

<template>
    <div class="row mb-2" v-if="movie">
	<div class="col-md-6">
	    <object :data="movie.movie.poster_url" type="image/png" class="w-100 m-2">
		<img :src="image" class="w-100 m-2">
	    </object>
	</div>
	<div class="col-md-6">
	    <h1>{{ movie.movie.title }}</h1>
	    
	    <div class="row">
		<div class="col-9">
		    <h3>{{ movie.movie.year }}</h3>
		    <div class="genres mt-2">
			<span class="badge m-1 bg-primary" v-for="genre in movie.genres">{{ genre.name }}</span>
		    </div>
		    <div class="runtime mt-2">
			<em>{{ movie.movie.runtime }}'</em>
		    </div>
		    <div class="directors mt-2">
			<h5>Directed by</h5>
			<span class="mr-1" v-for="director in movie.directors">{{ director.first_name }} {{ director.last_name }}</span>
		    </div>
		    <div class="plot mt-2">
			{{ movie.movie.plot }}
		    </div>
		</div>
		<div class="col-3 text-center">
		    <div class="rating"><h1>{{ movie.movie.rating }}</h1></div>
		</div>
	    </div>
	</div>
    </div>
    
    <div class="actors p-2">
	<h2>Starring</h2>
	<hr class="m-1">
	<b-card-group deck>
	    <ActorCard :actor="actor" v-for="actor in movie.actors"></ActorCard>
	</b-card-group>
    </div>
</template>


<style scoped>
    div.rating, div.rating * {
	margin:2px;
	padding:2px;
	font-size:30px;
	background-color:orange;
	border-radius:5px;
	color: black;
    }
</style>