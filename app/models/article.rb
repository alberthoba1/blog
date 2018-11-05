class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :description, presence: true, length: { minimum: 1, maximum: 150 }
  validates :user_id, presence: true
end
