require 'spec_helper'

describe SearchesController do
	context '#show' do
		it 'assigns @tweets' do
			Searcher.search_implementation = stub('searcher', search: [])
			get :show, id: 'tdd'
			should assign_to(:tweets)
		end

		it 'users Searcher to perform a search' do
			searcher_instance = stub('searcher instance', search: [])
			Searcher.stubs(new: searcher_instance)
			get :show, id: 'tdd'
			searcher_instance.should have_received(:search)
			Searcher.should have_received(:new).with('#tdd')
		end
	end
end