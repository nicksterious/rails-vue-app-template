class Director < ApplicationRecord
    searchkick

    validates_presence_of :first_name, allow_blank: false
    validates_presence_of :last_name, allow_blank: false

    has_and_belongs_to_many :movies

    def full_name
	[ first_name, last_name ].join(" ")
    end
end
