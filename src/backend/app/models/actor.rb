class Actor < ApplicationRecord
    before_validation :set_id_if_missing

    validates_presence_of :first_name
    validates_presence_of :last_name

    def set_id_if_missing
	self.id ||= SecureRandom.uuid
    end
end
