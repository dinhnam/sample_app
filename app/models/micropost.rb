class Micropost < ApplicationRecord
  validates :content, length: {maximum: 50}
  belongs_to :user
  validates :content, length: {maximum: 140},
                      presence: true
end
