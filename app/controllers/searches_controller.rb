class SearchesController < ApplicationController

	def show
		@tweets = Twitter.search("##{params[:id]}")
	end


	def new
	end

	def create
		redirect_to search_path(params[:search][:term])
	end


end