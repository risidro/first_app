class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  default_scope -> { order('created_at ASC') }
  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
