class MovieService < ApiService
    def endpoint
	"https://anjmihdde7.execute-api.us-east-1.amazonaws.com/kinside/movies"
    end

    def build(hash)
	movie = hash
	    .transform_keys { |key| key.to_s.underscore }
	    .deep_symbolize_keys


	builder = MovieBuilder.new( movie.except(:genres, :director, :actor_ids) )
	
	p movie
	builder.create_additional_data(
	    movie[:actor_ids].collect{ |i| { id: i } },
	    movie[:director].split(",").collect{ |n| n.strip },
	    movie[:genres]
	)
    end
end