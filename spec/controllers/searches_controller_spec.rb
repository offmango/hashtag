require 'spec_helper'

describe SearchesController do
	context '#show' do
		it 'assigns @tweets' do
			get :show, id: 'tdd'
			should assign_to(:tweets)
		end

		it 'users Twitter to perform a search' do
			Twitter.stubs(:search)
			get :show, id: 'tdd'
			Twitter.should have_received(:search).with('#tdd').once
		end
	end
end