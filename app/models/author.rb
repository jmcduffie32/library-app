class Author < ActiveRecord::Base
  has_many :books

  def self.assign_author(author_name)
    author_params = {name: author_name}
    find_by(name: author_name) || create(author_params)
  end
end
