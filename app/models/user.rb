class User < ApplicationRecord
  has_many :microposts
  validates :content, length: {maximum: 50}
  belongs_to :user
end
