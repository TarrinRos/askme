class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  # Many_to_many association with reassignment of join table to avoid the alphabetical join
  has_and_belongs_to_many :hashtags, join_table: :questions_hashtags

  validates :text, :user, presence: true, length: {maximum: 255}

  after_create :add_hashtags

  before_update :add_hashtags

  def add_hashtags
    question = Question.find_by(id: self.id)

    # Deletes all hashtags (useful for questions update)
    question.hashtags.clear

    # Scans text and answer of the question by the pattern and returns array
    hashtags = ("#{self.text} #{self.answer}").scan(/#[[:word:]]+/)

    hashtags.uniq.map do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.delete("#"))
      self.hashtags << hashtag
    end
  end
end
