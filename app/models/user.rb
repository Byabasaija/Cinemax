class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :articles, dependent: :destroy
end
