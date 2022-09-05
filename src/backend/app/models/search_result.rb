class SearchResult < ApplicationRecord
    self.table_name = "search_table"
    self.primary_key = :id
    def readonly?
	true
    end
end