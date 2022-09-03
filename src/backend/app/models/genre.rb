class Genre < ApplicationRecord
    searchkick

    validates_presence_of :name, allow_blank: false
    validates_uniqueness_of :name, case_sensitive: false

    has_and_belongs_to_many :movies

end
