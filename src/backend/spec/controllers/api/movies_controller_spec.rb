require "spec_helper"

RSpec.describe Api::MoviesController, :type => :controller do
    describe "index" do
	it "all" do
	    create_list :movie, 3
	    get :index, params: { format: :json }
	    expect(assigns[:movies].size).to eq 3
	end
	it "list multiple ids" do
	    create_list :movie, 15
	    get :index, params: { id: Movie.all.order(id: :asc).limit(4).pluck(:id), format: :json }
	    expect(assigns[:movies].size).to eq 4
	end
	it "by actor"
	it "by year"
	it "by genre" do
	    create_list :movie, 10
	    create_list :genre, 5
	    Movie.all.each do |movie|
		movie.genres << Genre.offset( rand(Genre.count) ).first
	    end
	    get :index, params: { genre: Movie.last.genres.last.name, format: :json }
	    expect(assigns[:movies].size).to eq Movie.last.genres.last.movies.count
	end
    end

    describe "show" do
	it "loads movie" do
	    create_list :movie, 3
	    get :show, params: { id: Movie.last.id, format: :json }
	    expect(assigns[:movie]).to eq Movie.last
	end
    end
end