require "spec_helper"

RSpec.describe Director, type: :model do

    describe "behavior"

    describe "relations"

    describe "validations" do
	it { should validate_presence_of :first_name }
	it { should validate_presence_of :last_name }
    end

end