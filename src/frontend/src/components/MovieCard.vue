<script>
    export default {
	props: ['movie'],
	data(){
	    return {
	        placeholders: [
		    "https://www.fillmurray.com/300/450",
		    "https://baconmockup.com/300/450",
		    "http://placebeard.it/300/450",
		    "https://loremflickr.com/300/450",
		    "https://www.placecage.com/300/450",
		    "http://placeimg.com/300/450/any"
		]
	    }
	},
	computed: {
	    randomImage() {
	        return this.placeholders[Math.floor(Math.random()*this.placeholders.length)];
	    }
	}
    }
</script>

<template>
    <div class="card">
	<object class="card-img-top" v-bind:data="movie.poster_url" type="image/png">
	    <img class="card-img-top" v-bind:src="randomImage" />
	</object>
	<div class="card-body text-center">
	    <h5>{{ movie.title }}</h5>
	    <span class="badge bg-secondary year">{{ movie.year }}</span>
	    <RouterLink :to="{ name: 'movie', params: { movie_id: movie.id }}" class="btn btn-primary">View</RouterLink>
	</div>
    </div>
</template>


<style scoped>
    .badge.year {
	position: absolute;
	top: 10px;
	right:10px;
    }
    .card {
	min-width:200px; 
	max-width:300px;
	position: relative;
    }
</style>