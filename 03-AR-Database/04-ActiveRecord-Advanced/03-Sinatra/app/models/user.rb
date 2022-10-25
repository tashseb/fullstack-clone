class User < ActiveRecord::Base
  has_many :posts
  # TODO: Add some validation
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  # TODO: Add some callbacks
  before_validation :strip_email
  after_create :welcome_email

  private

  def strip_email
    self.email = email.strip unless email.nil?
  end

  def welcome_email
    FakeMailer.instance.mail(email, "Welcome to HN!")
  end
end
