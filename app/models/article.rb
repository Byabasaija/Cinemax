class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_many :votes

  scope :most_recent, -> { order('created_at desc').limit(1) }
end
