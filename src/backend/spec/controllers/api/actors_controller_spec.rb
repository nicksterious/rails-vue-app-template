require "spec_helper"

RSpec.describe Api::ActorsController, :type => :controller do
    describe "index" do
	it "all actors" do
	    create_list :actor, 3
	    get :index, params: { format: :json }
	    expect(assigns[:actors].size).to eq 3
	end
	it "by movie"
	it "by genre"
    end

    describe "show" do
	it "shows actor information" do
	    create_list :actor, 3
	    get :show, params: { id: Actor.last.id, format: :json }
	    expect(assigns[:actor]).to eq Actor.last
	end
	it "actors"
	it "genres"
	it "directors"
    end
end