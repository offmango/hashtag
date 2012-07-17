class Searcher

	class_attribute :search_implementation
	self.search_implementation = Twitter

	def initialize(search_term)
		@search_term = search_term
	end

	def search
		search_implementation.search(@search_term)
	end

end