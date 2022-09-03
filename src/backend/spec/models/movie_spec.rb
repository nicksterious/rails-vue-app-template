require "spec_helper"

RSpec.describe Movie, type: :model do

    describe "behavior"

    describe "relations" do
	describe "actors" do
	    it "cannot register association twice" do
		movie = create :movie
		actor = create :actor
		movie.actors << actor
		expect(movie.actors.count).to eq 1
		expect { movie.actors << actor }.to raise_exception
	    end
	end
    end

    describe "validations" do
	it { should validate_presence_of :title }
	it { should validate_presence_of :plot }
	it { should validate_presence_of :poster_url }
	it { should validate_presence_of :page_url }
	it { should validate_numericality_of(:year).is_greater_than(1850).is_less_than_or_equal_to(Time.now.strftime("%Y").to_i) }
	it { should validate_numericality_of(:rating) }
	# ... and so on

	describe "factory" do
	    it "generates record" do
		movie = build :movie
		expect(movie).to be_valid
	    end
	end
    end

end