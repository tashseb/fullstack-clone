class Post < ActiveRecord::Base
  belongs_to :user
  # TODO: Copy-paste your code from previous exercise
  validates :user, presence: true
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :title, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }

  scope :descending_order, -> { order(votes: :desc) }
end
