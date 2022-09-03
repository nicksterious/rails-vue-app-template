class Api::ActorsController < ApplicationController
  def index
    @actors = ActorQuery.new( Actor.all ).call(params)
  end

  def show
    @actor = Actor.find(params[:id])
  end
end
