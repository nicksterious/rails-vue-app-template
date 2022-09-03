class Genre < ApplicationRecord
    validates_presence_of :name, allow_blank: false
end
