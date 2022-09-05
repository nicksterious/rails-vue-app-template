FactoryBot.define do
  factory :genre, class: Genre do
    name 	{ Faker::Book.genre } # no Movies.genre :(
  end
end