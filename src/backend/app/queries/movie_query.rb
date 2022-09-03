class MovieQuery
    attr_accessor :initial_scope

    def initialize(initial_scope = Movie.all)
        @initial_scope = initial_scope
    end

    def call(params)
	scoped = by_id(initial_scope, params[:id])
	scoped = by_title(scoped, params[:title])
	scoped = by_year(scoped, params[:year])
	scoped = by_genre(scoped, params[:genre])
	scoped = by_genre_id(scoped, params[:genre_id])
	scoped = by_actor_id(scoped, params[:actor_id])
	scoped = by_actor_ids(scoped, params[:actor_ids])
	scoped
    end

private
    def by_id(scope, id = nil)
	id ? scope.where(id: id) : scope
    end

    def by_title(scope, title = nil)
	title ? scope.where(title: title) : scope
    end

    def by_year(scope, year = nil)
	year ? scope.where(year: year) : scope
    end

    def by_genre(scope, genre = nil)
	genre ? scope.joins(:genres).where("genres.name" => genre) : scope
    end

    def by_genre_id(scope, genre_id = nil)
	genre_id ? scope.joins(:genres).where("genres.id" => genre_id) : scope
    end

    def by_actor_id(scope, actor_id = nil)
	actor_id ? scope.joins(:actors).where("actors.id" => actor_id) : scope
    end

    def by_actor_ids(scope, actor_ids = nil)
	actor_ids ? scope.joins(:actors).where("actors.id" => actor_ids) : scope
    end

end
