class Message < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
  format: { with: VALID_EMAIL_REGEX }

  validates :title, presence: true,
  length: { minimum: 5, maximum: 50}

  validates :description, length: { maximum: 500 }


end
