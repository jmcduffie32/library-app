class Author < ActiveRecord::Base
  has_many :books

  def self.assign_author(author_name)
    author_params = {name: author_name}
    Author.find_by(name: author_name ) || Author.create(author_params)
  end
end
