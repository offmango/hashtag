class SearchesController < ApplicationController

	def show
		@tweets = Searcher.new("##{params[:id]}").search
	end


	def new
	end

	def create
		redirect_to search_path(params[:search][:term])
	end


end