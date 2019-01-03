class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags, join_table: :questions_hashtags

  validates :text, :user, presence: true, length: {maximum: 255}

  def add_hashtags
    # Deletes all hashtags
    self.hashtags.clear

    hashtags = self.text.scan(/#[[:word:]]+/)
    hashtags.uniq.map do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.delete("#"))
      self.hashtags << hashtag
    end
  end
end
