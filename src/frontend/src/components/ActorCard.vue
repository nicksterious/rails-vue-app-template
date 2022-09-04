<script>
    import randomImage from '../random_image'

    export default {
	props: ['actor'],
	computed: {
	    actorFullName() {
		return [this.actor.first_name, this.actor.last_name].join(" ")
	    },
	    image(){
		return randomImage(100,100)
	    }
	}
    }
    
    
</script>

<template>
    <div class="card">
	<img class="card-img-top" v-bind:src="image">
	<div class="card-body text-center">
	    <h4>{{ actor.first_name }} {{actor.last_name }}</h4>
	    <RouterLink :to="{ name: 'actor', params: { actor_id: actor.id }}" class="btn btn-primary">Profile</RouterLink>
	</div>
    </div>
</template>

<style scoped>
    .card {
	max-width:200px;
	min-width:100px;
    }
</style>