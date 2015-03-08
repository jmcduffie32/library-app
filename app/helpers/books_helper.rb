module BooksHelper
	def image_from_ol(isbn)
		image_tag "http://covers.openlibrary.org/b/isbn/#{isbn}-M.jpg"
		
	end
end
