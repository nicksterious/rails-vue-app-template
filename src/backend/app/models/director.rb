class Director < ApplicationRecord
    validates_presence_of :first_name, allow_blank: false
    validates_presence_of :last_name, allow_blank: false
end
