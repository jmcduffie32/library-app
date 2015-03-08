class Book < ActiveRecord::Base
	belongs_to :genre
	belongs_to :author

	scope :search, ->(keyword){ where('keywords LIKE ?',"%#{keyword}%") if keyword.present?}
	scope :finished, ->{ where(read: true)}
	scope :filter, ->(name){ joins(:genre).where('genres.name = ?', name) if name.present?}

	before_save :set_keywords

	validates :name, presence: true, uniqueness: true

	protected
		def set_keywords
			self.keywords = [name, author.name, description].map(&:downcase).join(' ')			
		end
end
