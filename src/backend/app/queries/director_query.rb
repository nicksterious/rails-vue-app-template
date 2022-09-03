class DirectorQuery
    attr_accessor :initial_scope

    def initialize(initial_scope = Director.all)
        @initial_scope = initial_scope
    end

    def call(params)
	scoped = by_id(initial_scope, params[:id])
	scoped = by_first_name(scoped, params[:first_name])
	scoped = by_last_name(scoped, params[:last_name])
	scoped = by_full_name(scoped, params[:full_name])
	scoped = by_movie_id(scoped, params[:movie_id])
	scoped
    end

private
    def by_id(scope, id = nil)
	id ? scope.where(id: id) : scope
    end

    def by_first_name(scope, name = nil)
	name ? scope.where(first_name: name) : scope
    end

    def by_last_name(scope, name = nil)
	name ? scope.where(last_name: name) : scope
    end

    def by_full_name(scope, name = nil)
	first, last = name.split(" ") if name
	name ? scope.where(first_name: first, last_name: last) : scope
    end

    def by_movie_id(scope, movie_id = nil)
	movie_id ? scope.joins(:movies).where("movies.id = ?", movie_id) : scope
    end
end
