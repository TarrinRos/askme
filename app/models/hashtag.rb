class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions

  before_validation { name.downcase! if self.name }

  validates :name, presence: true
end
