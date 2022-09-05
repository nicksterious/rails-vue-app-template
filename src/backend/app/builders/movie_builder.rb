class MovieBuilder
    attr_accessor :movie

    def initialize(attributes)
	@movie = Movie.create attributes
    end


    def create_additional_data(actors = [], directors = [], genres = [])
	genres.each do |genre|
	    add_genre genre
	end

	directors.each do |director|
	    add_director director
	end

	actors.each do |actor|
	    add_actor actor
	end
    end


    def add_director(name)
	first, last = name.split(" ")[0..1]
	@movie.directors << Director.find_or_create_by(first_name: first, last_name: last) rescue ActiveRecord::RecordInvalid
    end


    def add_actor(args)
	@movie.actors << Actor.find_or_create_by(args) rescue ActiveRecord::RecordInvalid
    end


    def add_genre(name)
	@movie.genres << Genre.find_or_create_by(name: name)
    end
end