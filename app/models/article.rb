class Article < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { minimum: 2, maximum: 100 }
    validates :title, format: { with: /\A(?!\@)/ }
    
  validates :content, presence: true
  validates :content, length: { minimum: 2 }
  validates :content, uniqueness: true

  validate :validate_title_and_content_length

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end


  private
  def validate_title_and_content_length
    char_count = self.title.length + self.content.length
    errors.add(:content, '10文字いじょうで！') unless char_count > 10
  end
end

