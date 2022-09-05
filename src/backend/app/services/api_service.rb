class ApiService
    require 'faraday'
    require 'faraday/net_http'

    def fetch
	Rails.cache.fetch( endpoint ) do
	    JSON.parse( Faraday.get( endpoint ).body )
	end
    end

    def reindex
	[ Actor, Genre, Director, Movie ].each do |model|
	    model.send(:reindex)
	end
    end

    def process
	fetch.each do |record|
	    build record
	end
	reindex
    end

end