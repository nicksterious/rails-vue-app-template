class Genre < ApplicationRecord
    validates_presence_of :name, allow_blank: false

    has_and_belongs_to_many :movies

end
