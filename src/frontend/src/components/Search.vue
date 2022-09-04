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
                                response.data.hits.hits.map( res => { return {
                                        id: res._id,
                                        title: res._source.title
                                    }
                                })
                            )
                        } catch(err) {
                            // TODO handle error or no movies found
                            console.log(err)
                        }
                    })
                }
            },
            clearSearch(){
                this.search_results = []
                this.search_string = ""
            }
	}
    }
</script>

<template>
    <div class="search-form">
    <b-input-group class="m-2">
        <b-form-input type="text" v-model="search_string" placeholder="Search movie or actor..."></b-form-input>
        <b-input-group-append v-if="search_string != ''">
            <b-button variant="success" @click="search" @keydown.native="search">Search</b-button>
        </b-input-group-append>
        <b-input-group-append v-if="search_string != ''">
            <b-button variant="outline-secondary" @click="clearSearch">X</b-button>
        </b-input-group-append>
    </b-input-group>

    <div v-if="search_results.length > 0 && search_string != ''" class="search-results p-2">
        <div class="search-result" v-for="result in search_results">
            <RouterLink :to="{ name: 'movie', params: { movie_id: result.id }}">{{ result.title }} <small class="float-right">{{ result.year }}</small></RouterLink>
        </div>
    </div>
    </div>

</template>
