FactoryBot.define do
  factory :movie, class: Movie do
    title 	{ Faker::Movie.title } 
    year	{ rand(1980..2022) }
    runtime	{ rand(90..150) }
    plot	{ Faker::Company.bs }
    poster_url	{ "https://placehold.jp/#{SecureRandom.hex(3)}/ffffff/300x450.png" }
    rating	{ rand(50..95).to_f/10 }
    page_url	{ "https://www.imdb.com/find?q=movie+title&ref_=nv_sr_sm" }
  end
end