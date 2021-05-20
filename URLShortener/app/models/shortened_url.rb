require 'SecureRandom'

class ShortenedUrl < ApplicationRecord
  def self.random_code
    SecureRandom.urlsafe_base64
  end

  validates: short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.(user, long_url)
    options = {}

    # nice code for adding short_url, user, and long_url to hash?

    ShortenedUrl.create!(options)
  end

  def initialize(options)
    short_url = ShortenedUrl.random_code

    ShortenedUrl.exists?()

    options[:short_url] = short_url

    super(options)
  end
end

#ShortenedUrl