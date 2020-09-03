class Article < ApplicationRecord
    has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes
  has_many :voters, through: :votes
  belongs_to :author, class_name: 'User'
  validates :title, :image, :categories, presence: true
  validates :text, presence: true, length: { in: 10..2000 }
  validates :title, presence: true, length: { in: 6..40 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  has_many :users_vote, through: :votes, source: :user
  scope :highest_vote, -> { order(votes_count: :desc) }
  has_one_attached :image
end
