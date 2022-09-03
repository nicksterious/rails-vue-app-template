require "spec_helper"

RSpec.describe Genre, type: :model do

    describe "behavior"

    describe "relations" do
	it { should have_many :actors }
	it { should have_and_belong_to_many(:movies) }
    end

    describe "validations" do
	it { should validate_presence_of :name }
	it { should validate_uniqueness_of(:name).case_insensitive }
    end

end