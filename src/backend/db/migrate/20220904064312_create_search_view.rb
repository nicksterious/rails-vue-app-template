class CreateSearchView < ActiveRecord::Migration[6.1]
  def change
    create_table :search_views do |t|
	execute "drop view if exists search_table"
	execute <<-ENDSQL
	    create view search_table as select movies.*, 
		actors.id as actor_id, concat(actors.first_name, ' ', actors.last_name) as actor_full_name, 
		directors.id as director_id, concat(directors.first_name, ' ', directors.last_name) as director_full_name,
		genres.id as genre_id, genres.name as genre_name
	    from movies 
		left join actors_movies on movies.id = actors_movies.movie_id 
		left join actors on actors_movies.actor_id = actors.id 
		left join genres_movies on movies.id = genres_movies.movie_id 
		left join genres on genres_movies.genre_id = genres.id 
		left join directors_movies on directors_movies.movie_id = directors_movies.movie_id 
		left join directors on directors_movies.director_id = directors.id;
	ENDSQL
	# TODO optimize underlying tables to improve search performance
    end
  end
end
