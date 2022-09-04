require "spec_helper"

RSpec.describe Actor, type: :model do

    describe "behavior" do
	it "sets default ID if none specified" do
	    actor = create :actor # Actor.new(first_name: "Mark", last_name: "Wahlberg")
	    expect(actor).to be_valid
	    expect(actor.id).to_not eq nil
	end

	it ".co_actors" do
	    actors = create_list :actor, 10
	    movies = create_list :movie, 7
	    movies.each do |movie|
		actors.each do |actor|
		    p "#{movie.id}: attach actor ##{actor.id}"
		    movie.actors << actor
		end
	    end
	    # 7 movies, 2 actors each

	    more_actors = create_list :actor, 3
	    test_actor = create :actor
	    movies[2..4].each do |movie|
		more_actors.each do |actor|
		    p "#{movie.id}: attach actor ##{actor.id}"
		    movie.actors << actor
		end
		p "#{movie.id}: attach test actor ##{test_actor.id}"
		movie.actors << test_actor
	    end

	    # this only checks that there are some co-actors
	    expect( (test_actor.co_actors & more_actors).size ).to_not eq 0
	    # TODO make sure they are the TOP co-actors tho
	end
    end

    describe "relations" do
	it { should have_many :genres }
	it { should have_and_belong_to_many(:movies) }
    end

    describe "validations" do
	it { should validate_presence_of :first_name }
	it { should validate_presence_of :last_name }
    end

end