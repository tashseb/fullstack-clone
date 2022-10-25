require 'uri'
class Post < ActiveRecord::Base
  belongs_to :user
  # TODO: Add some validation
  validates :user, presence: true
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :title, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
