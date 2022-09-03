<script>
    export default {
	props: ['actor'],
	computed: {
	    actorFullName() {
		return [this.actor.first_name, this.actor.last_name].join(" ")
	    }
	}
    }
    
    
</script>

<template>
    <b-card v-bind:title="actorFullName" img-src="https://placekeanu.com/100/100/g" img-top class="m-1">
	<RouterLink :to="{ name: 'actor', params: { actor_id: actor.id }}" class="btn btn-primary">Profile</RouterLink>
    </b-card>
</template>

<style scoped>
    .card {
	max-width:200px;
	min-width:100px;
    }
</style>