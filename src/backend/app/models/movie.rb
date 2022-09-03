class Movie < ApplicationRecord
    searchkick

    validates_presence_of :title, allow_blank: false
    validates :year, numericality: { only_integer: true, greater_than: 1850, less_than_or_equal_to: Time.now.strftime("%Y").to_i }
    validates :runtime, numericality: { greater_than: 0 }
    validates_presence_of :plot, allow_blank: false
    validates_presence_of :poster_url, allow_blank: false
    validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
    validates_presence_of :page_url, allow_blank: false

    # can't validate uniqueness based on anything really

    has_and_belongs_to_many :actors
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :directors
end
