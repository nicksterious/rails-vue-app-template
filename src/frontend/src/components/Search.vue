<script>
    import axios from 'axios'
    export default {
	data() {
	    return {
		search_string: "",
		search_results: []
	    }
	},
	methods:{
            search(){
              if (this.search_string.length > 3) {
            	this.search_results = [];
                const query = {
                    query: {
                        query_string: {
                            query: this.search_string
                        }
                    }
                }
                axios
                    .get("http://kinside.dev.flinkwise.com:9200/_search",{
                        params: {
                            source: JSON.stringify(query),
                            source_content_type: 'application/json'
                        }
                    })
                    .then(response => {
                        try {
                            this.search_results = this.search_results.concat(
                                response.data.hits.hits.map( res => { 
                            	    if ( res._index.includes("movies") ) {
                            		return {
                                    	    movie_id: res._id,
                                    	    title: res._source.title,
                                    	    year: res._source.year
                                	}
                            	    }
                            	    if ( res._index.includes("actors") ){
                            		return {
                            		    actor_id: res._id,
                            		    first_name: res._source.first_name,
                            		    last_name: res._source.last_name
                            		}
                            	    }
                            	    if ( res._index.includes("directors") ){
                            		return {
                            		    director_id: res._id,
                            		    first_name: res._source.first_name,
                            		    last_name: res._source.last_name
                            		}
                            	    }
                                })
                            )
                        } catch(err) {
                            // TODO handle error or no movies found
                            console.log(err)
                        }
                        // TODO handle searches for actors and directors as well
                        console.log(this.search_results)
                    })
              }
            },
            clearSearch(){
                this.search_results = []
                this.search_string = ""
            }
	},
	computed: {
	    movieResults(){
		return this.search_results.filter( (r) => r.hasOwnProperty('movie_id') )
	    },
	    actorResults(){
		return this.search_results.filter( (r) => r.hasOwnProperty('actor_id') )
	    }
	},
	watch: {
	    search_string(){
		this.search()
	    }
	}
    }
</script>

<template>
    <div class="search-form">
    <b-input-group class="m-2">
        <b-form-input type="text" v-model="search_string" placeholder="Search movie or actor..."></b-form-input>
        <b-input-group-append v-if="search_string != ''">
            <b-button variant="success" @click="search" debounce="500">Search</b-button>
        </b-input-group-append>
        <b-input-group-append v-if="search_string != ''">
            <b-button variant="outline-secondary" @click="clearSearch">X</b-button>
        </b-input-group-append>
    </b-input-group>

    <div v-if="search_results.length > 0 && search_string != ''" class="search-results p-2 row">
	<div class="col-6" v-if="movieResults.length > 0">
	    <h5>Movies</h5>
    	    <div class="search-result" v-for="result in movieResults">
    		<RouterLink :to="{ name: 'movie', params: { movie_id: result.movie_id }}">{{ result.title }} <small class="text-muted">{{ result.year }}</small></RouterLink>
    	    </div>
	</div>
	<div class="col-6" v-if="actorResults.length > 0">
	    <h5>Actors</h5>
    	    <div class="search-result" v-for="result in actorResults">
        	<RouterLink :to="{ name: 'actor', params: { actor_id: result.actor_id }}">{{ result.first_name }} {{ result.last_name}} <small class="text-muted">actor</small></RouterLink>
    	    </div>
	</div>
	<!-- TODO add directors pages or filter movie list by director using query object -->
    </div>
    </div>

</template>


<style scoped>
    .search-result a {
	text-decoration: none;
    }
</style>