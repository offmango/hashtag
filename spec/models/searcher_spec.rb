require 'spec_helper'

describe Searcher do
	context '#search' do

		it 'uses Twitter to perform a search of the term' do 
			Twitter.stubs(:search)
			search_term = '#tdd'
			Searcher.new(search_term).search
			Twitter.should have_received(:search).with(search_term).once
		end

		it 'allows the search mechanism to change' do
			my_awesome_search = stub('my awesome search', search: [])
			Searcher.search_implementation = my_awesome_search
			search_term = '#tdd'
			Searcher.new(search_term).search
			my_awesome_search.should have_received(:search).with(search_term).once
		end
	end
end