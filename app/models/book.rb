class Book < ActiveRecord::Base
  belongs_to :genre
  belongs_to :author

  scope :search, ->(keyword){ where('keywords LIKE ?',"%#{keyword}%") if keyword.present?}
  scope :finished, ->{ where(read: true)}
  scope :filter, ->(name){ joins(:genre).where('genres.name = ?', name) if name.present?}

  before_save :set_keywords

  validates :name, presence: true, uniqueness: true

  def self.create_book(book_params)
    book_params[:author] = Author.assign_author(book_params[:author])
    create(book_params)
  end

  protected
  def set_keywords
    self.keywords = [name, author.name, description].map(&:downcase).join(' ')
  end
end
