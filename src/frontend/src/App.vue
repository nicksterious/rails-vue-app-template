<script setup>
    // TODO see if we've hit an actor/movie page and load them up
</script>

<template>

    <div class="row main">
	<div class="col-md-6">
	    <MovieList/>
	</div>
	<div class="col-md-6 p-1">
	    <RouterView />
	</div>
    </div>

</template>

<style scoped>
    div.main > div {
	height:100vh;
	overflow-y: scroll;
    }
</style>
