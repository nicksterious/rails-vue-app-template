class Api::MoviesController < ApplicationController
  def index
    @movies = MovieQuery.new( Movie.all ).call(params)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
