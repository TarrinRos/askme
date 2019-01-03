class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  # Many_to_many association with reassignment of join table to avoid the alphabetical join
  has_and_belongs_to_many :hashtags, join_table: :questions_hashtags

  validates :text, :user, presence: true, length: {maximum: 255}

  def add_hashtags
    # Deletes all hashtags (useful for questions update)
    self.hashtags.clear

    # Scans text and answer of the questions by the pattern and returns array of results
    hashtags_scaned = text.scan(/#[[:word:]]+/)

    hashtags_scaned.uniq.map do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.delete("#"))
      self.hashtags << hashtag
    end
  end
end
