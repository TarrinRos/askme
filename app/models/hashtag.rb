class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions, join_table: :questions_hashtags

  before_validation { name.downcase! if self.name }

  validates :name, presence: true
end
