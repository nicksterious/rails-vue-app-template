<script>
    import randomImage from '../random_image'
    export default {
	props: ['movie'],
	computed: {
	    image(){
		return randomImage(300, 450)
	    }
	}
    }
</script>

<template>
    <div class="card">
	<object class="card-img-top" :data="movie.poster_url" type="image/png">
	    <img class="card-img-top" :src="image" />
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
    @media only screen and (max-width:1024px) {
	.card {
	    max-width:48%;
	}
    }
</style>