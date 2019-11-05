# frozen_string_literal: true

class User < ApplicationRecord
  before_create :generate_token

  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :posts

  private

  def generate_token
    self.remember_token = Digest::SHA1.hexdigest SecureRandom.urlsafe_base64.to_s
  end
end
