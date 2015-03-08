class BooksController < ApplicationController
	

	def index
		@books = Book.includes(:genre).search(params[:keyword]).filter(params[:filter])
		@genres = Genre.all		
	end

	def show
		@book = Book.find(params[:id])
	end

	
end
