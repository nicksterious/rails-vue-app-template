require "spec_helper"

RSpec.describe Actor, type: :model do

    describe "behavior" do
	it "sets default ID if none specified" do
	    actor = Actor.new(first_name: "Mark", last_name: "Wahlberg")
	    expect(actor).to be_valid
	    expect(actor.id).to_not eq nil
	end
    end

    describe "relations" do
	it { should have_and_belong_to_many(:movies) }
    end

    describe "validations" do
	it { should validate_presence_of :first_name }
	it { should validate_presence_of :last_name }
    end

end