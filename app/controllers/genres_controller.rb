class GenresController < ApplicationController
	def index
		@genres = Genre.all 
	end

	def show
		@genre = Genre.find(params[:id])
		@name = @genre.name
		@books = @genre.books
	end
end
