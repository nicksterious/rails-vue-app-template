require "spec_helper"

RSpec.describe MovieBuilder do
    describe "behavior" do
	before do
	    m = build :movie, title: "Mile High Club"
	    @builder = MovieBuilder.new(m
		.attributes
		.deep_symbolize_keys
		.except(:id)
	    )
	end

	it ".new creates movie record" do
	    expect(Movie.last.title).to eq "Mile High Club"
	end

	it ".add_genre" do
	    @builder.add_genre "Sci-Fi"
	    expect(@builder.movie.genres.pluck(:name)).to include "Sci-Fi"
	end

	it ".add_director" do
	    @builder.add_director "John Smith"
	    director = Director.last
	    expect(director.first_name).to eq "John"
	    expect(director.last_name).to eq "Smith"
	    expect(@builder.movie.directors).to include director
	end

	it ".add_actor" do
	    @builder.movie.update(title: "They are amongst us!")
	    @builder.add_actor first_name: "Mark", last_name: "Zuckerberg"
	    actor = Actor.last
	    expect(@builder.movie.actors).to include actor
	end

	it ".create_additional_data" do
	    create_list :actor, 2
	    create_list :genre, 3
	    create_list :director, 4
	    
	    actors = create_list :actor, rand(2..3)
	    directors = create_list :director, rand(1..2)
	    genres = create_list :genre, rand(1..2)
	    @builder.create_additional_data(
		actors.collect{ |a| a.attributes.deep_symbolize_keys },
		directors.collect{ |d| d.full_name },
		genres.pluck(:name)
	    )
	    expect(@builder.movie.actors.count).to eq actors.size
	    expect(@builder.movie.genres.count).to eq genres.size
	    expect(@builder.movie.directors.count).to eq directors.size 
	end

    end
end