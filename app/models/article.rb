class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    validates :image, presence: true

    belongs_to :user, foreign_key: :author_id
    has_and_belongs_to_many :categories
    has_one_attached :image
    has_many :votes

    scope :most_recent, -> {order('created_at desc').limit(1) }
end