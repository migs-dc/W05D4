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
end