class Actor < ApplicationRecord
    searchkick

    before_validation :set_id_if_missing

    validates_presence_of :first_name, allow_blank: false
    validates_presence_of :last_name, allow_blank: false
    
    has_and_belongs_to_many :movies

    def set_id_if_missing
	self.id ||= SecureRandom.uuid
    end
end
