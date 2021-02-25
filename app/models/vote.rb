class Vote < ApplicationRecord
  validates :article_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :article

  scope :most_voted, lambda {
                       select('article_id, count(article_id) as count').group(:article_id).order('count desc').limit(1)
                     }
end
